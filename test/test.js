#!/usr/bin/env node

/* jslint node:true */
/* global it:false */
/* global xit:false */
/* global describe:false */
/* global before:false */
/* global after:false */

'use strict';

var execSync = require('child_process').execSync,
    ejs = require('ejs'),
    expect = require('expect.js'),
    fs = require('fs'),
    mkdirp = require('mkdirp'),
    path = require('path'),
    rimraf = require('rimraf'),
    superagent = require('superagent'),
    webdriver = require('selenium-webdriver');

var by = require('selenium-webdriver').By,
    until = require('selenium-webdriver').until;

process.env.NODE_TLS_REJECT_UNAUTHORIZED = '0';

describe('Application life cycle test', function () {
    this.timeout(0);
    var firefox = require('selenium-webdriver/firefox');
    var server, browser = new firefox.Driver();
    var LOCATION = 'phabtest';
    var repodir = '/tmp/testrepo';
    var app, reponame = 'testrepo';
    var username = process.env.USERNAME;
    var password = process.env.PASSWORD;
    var superadmin_username = 'superadmin', superadmin_password = 'changeme123';
    var email, token;

    before(function (done) {
        if (!process.env.USERNAME) return done(new Error('USERNAME env var not set'));
        if (!process.env.PASSWORD) return done(new Error('PASSWORD env var not set'));

        execSync('chmod o-rw,g-rw id_rsa');

        var seleniumJar= require('selenium-server-standalone-jar');
        var SeleniumServer = require('selenium-webdriver/remote').SeleniumServer;
        server = new SeleniumServer(seleniumJar.path, { port: 4444 });
        server.start();

        done();
    });

    after(function (done) {
        browser.quit();
        server.stop();
        rimraf.sync(repodir);
        done();
    });

    xit('build app', function () {
        execSync('cloudron build', { cwd: path.resolve(__dirname, '..'), stdio: 'inherit' });
    });

    it('can login', function (done) {
        var inspect = JSON.parse(execSync('cloudron inspect'));

        superagent.post('https://' + inspect.apiEndpoint + '/api/v1/developer/login').send({
            username: username,
            password: password
        }).end(function (error, result) {
            if (error) return done(error);
            if (result.statusCode !== 200) return done(new Error('Login failed with status ' + result.statusCode));

            token = result.body.token;

            superagent.get('https://' + inspect.apiEndpoint + '/api/v1/profile')
                .query({ access_token: token }).end(function (error, result) {
                if (error) return done(error);
                if (result.statusCode !== 200) return done(new Error('Get profile failed with status ' + result.statusCode));

                email = result.body.email;
                done();
            });
        });
    });

    it('install app', function () {
        execSync('cloudron install --new --wait --location ' + LOCATION, { cwd: path.resolve(__dirname, '..'), stdio: 'inherit' });
    });

    it('can get app information', function () {
        var inspect = JSON.parse(execSync('cloudron inspect'));

        app = inspect.apps.filter(function (a) { return a.location === LOCATION; })[0];

        expect(app).to.be.an('object');
    });

    it('can get the main page', function (done) {
        superagent.get('https://' + app.fqdn).end(function (error, result) {
            expect(error).to.be(null);
            expect(result.status).to.eql(200);

            done();
        });
    });

    it('shows normal and LDAP login screens', function (done) {
        browser.get('https://' + app.fqdn);
        browser.wait(until.elementLocated(by.xpath('//span["Login to Phabricator"]')), 1000);
        browser.wait(until.elementLocated(by.xpath('//span["Login or Register with LDAP"]')), 1000).then(function() { done(); });
    });

    it('can login using default credentials', function (done) {
        browser.get('https://' + app.fqdn);
        browser.findElement(by.xpath('//input[@type="text" and @name="username"]')).sendKeys(superadmin_username);
        browser.findElement(by.xpath('//input[@type="password" and @name="password"]')).sendKeys(superadmin_password);
        browser.findElement(by.xpath('//button[contains(text(), "Login")]')).click();
        browser.findElement(by.xpath('//span[contains(text(), "Differential")]')).then(function () { done(); });
    });

    it('can link the account to LDAP', function (done) {
        browser.get('https://' + app.fqdn + '/auth/link/ldap:self/');
        browser.findElement(by.xpath('//input[@name="ldap_username" and @type="text"]')).sendKeys(username);
        browser.findElement(by.xpath('//input[@name="ldap_password" and @type="password"]')).sendKeys(password);
        browser.findElement(by.xpath('//button[contains(text(), "Link Accounts")]')).click();
        browser.wait(until.elementLocated(by.xpath('//button[contains(text(), "Confirm Account Link")]')), 4000);
        browser.findElement(by.xpath('//button[contains(text(), "Confirm Account Link")]')).click();
        browser.wait(until.elementLocated(by.xpath('//li[contains(text(), "Permanently Linked")]')), 1000).then(function () { done(); });
    });

    it('can login using LDAP', function (done) {
        browser.manage().deleteAllCookies();
        browser.get('https://' + app.fqdn);
        browser.findElement(by.xpath('//input[@name="ldap_username" and @type="text"]')).sendKeys(username);
        browser.findElement(by.xpath('//input[@name="ldap_password" and @type="password"]')).sendKeys(password);
        browser.findElement(by.xpath('//button[contains(text(), "Login or Register")]')).click();
        browser.wait(until.elementLocated(by.xpath('//span[contains(text(), "Differential")]')), 1000).then(function() { done(); });
    });

    it('can create a maniphest task', function (done) {
        browser.get('https://' + app.fqdn + '/maniphest/task/edit/');
        browser.findElement(by.xpath('//input[@name="title" and @type="text"]')).sendKeys('this is a task');
        browser.findElement(by.xpath('//button[contains(text(), "Create New Task")]')).click();
         browser.wait(function () {
            return browser.getCurrentUrl().then(function (url) {
                return url === 'https://' + app.fqdn + '/T1';
            });
        }, 4000).then(function () { done(); });
    });

    it('can add public key', function (done) {
        browser.get('https://' + app.fqdn + '/settings/panel/ssh/');
        var publicKey = fs.readFileSync(__dirname + '/id_rsa.pub', 'utf8');

        browser.findElement(by.xpath('//div[contains(text(), "Upload Public Key")]')).click();
        browser.findElement(by.xpath('//input[@name="name" and @type="text"]')).sendKeys('testkey');
        browser.findElement(by.xpath('//textarea[@name="key"]')).sendKeys(publicKey);

        browser.findElement(by.xpath('//button[contains(text(), "Upload Public Key")]')).click().then(function () { done(); });
    });

    it('can create repo', function (done) {
        browser.get('https://' + app.fqdn + '/diffusion/create/');
        browser.findElement(by.xpath('//label[.="Git"]')).click(); // "." means innerText apparently
        browser.findElement(by.xpath('//input[@type="submit"]')).click();

        browser.findElement(by.xpath('//input[@name="name" and @type="text"]')).sendKeys('testrepo');
        browser.findElement(by.xpath('//input[@type="submit"]')).click();

        browser.sleep(1000);
        browser.findElement(by.xpath('//input[@type="submit"]')).click(); // permissions

        browser.sleep(1000);
        browser.findElement(by.xpath('//label[.="Create Repository Now"]')).click(); // "." means innerText apparently
        browser.findElement(by.xpath('//input[@value="Save"]')).click(); // Done..

        browser.wait(function () {
            return browser.getCurrentUrl().then(function (url) {
                return url === 'https://' + app.fqdn + '/diffusion/1/edit/';
            });
        }, 40000);
        browser.sleep(20000).then(function () { done(); }); // it takes sometime for the repo to get created
    });

    it('displays correct clone url', function (done) {
        browser.get('https://' + app.fqdn + '/diffusion/1/');
        browser.findElement(by.xpath('//input[@type="text" and @class="diffusion-clone-uri"]')).getAttribute('value').then(function (cloneUrl) {
            expect(cloneUrl).to.be('git clone ssh://git@' + app.fqdn + ':29418/diffusion/1/testrepo.git');
            done();
        });
    });

    it('can push to repo', function (done) {
        var env = Object.create(process.env);
        env.GIT_SSH = __dirname + '/git_ssh_wrapper.sh';
        execSync('git push -f ssh://git@' + app.fqdn + ':29418/diffusion/1/testrepo.git master', { env: env }); // push this repo
        done();
    });

    it('can clone the url', function (done) {
        var env = Object.create(process.env);
        env.GIT_SSH = __dirname + '/git_ssh_wrapper.sh';
        execSync('git clone ssh://git@' + app.fqdn + ':29418/diffusion/1/testrepo.git ' + repodir, { env: env });
        done();
    });

    it('can add and push a file', function (done) {
        var env = Object.create(process.env);
        env.GIT_SSH = __dirname + '/git_ssh_wrapper.sh';
        execSync('touch newfile && git add newfile && git commit -a -mx && git push ssh://git@' + app.fqdn + ':29418/diffusion/1/testrepo.git master',
                 { env: env, cwd: repodir });
        rimraf.sync('/tmp/testrepo');
        done();
    });

    it('can upload a file', function (done) {
        browser.get('https://' + app.fqdn + '/file/upload');
        execSync('truncate -s 2M /tmp/bigfile.txt'); // if it's < 1M it is stored in sql db. so create something big enough
        browser.findElement(by.xpath('//input[@type="file" and @name="file"]')).sendKeys('/tmp/bigfile.txt');
        browser.findElement(by.xpath('//button[contains(text(), "Upload")]')).click();

        browser.wait(function () {
            return browser.getCurrentUrl().then(function (url) {
                return url === 'https://' + app.fqdn + '/F3';
            });
        }, 40000).then(function () { done(); });

    });

    it('can restart app', function (done) {
        execSync('cloudron restart');
        done();
    });

    it('can clone the url', function (done) {
        var env = Object.create(process.env);
        env.GIT_SSH = __dirname + '/git_ssh_wrapper.sh';
        execSync('git clone ssh://git@' + app.fqdn + ':29418/diffusion/1/testrepo.git ' + repodir, { env: env });
        expect(fs.existsSync(repodir + '/newfile')).to.be(true);
        rimraf.sync(repodir);
        done();
    });

    it('backup app', function () {
        execSync('cloudron backup --app ' + app.id, { cwd: path.resolve(__dirname, '..'), stdio: 'inherit' });
    });

    it('restore app', function () {
        execSync('cloudron restore --app ' + app.id, { cwd: path.resolve(__dirname, '..'), stdio: 'inherit' });
    });

    it('can clone the url', function (done) {
        var env = Object.create(process.env);
        env.GIT_SSH = __dirname + '/git_ssh_wrapper.sh';
        execSync('git clone ssh://git@' + app.fqdn + ':29418/diffusion/1/testrepo.git ' + repodir, { env: env });
        expect(fs.existsSync(repodir + '/newfile')).to.be(true);
        rimraf.sync(repodir);
        done();
    });

    it('has the task', function (done) {
        browser.get('https://' + app.fqdn + '/T1');
        browser.findElement(by.xpath('//span[contains(text(), "this is a task")]')).then(function () { done(); });
    });

    it('has the file', function (done) {
        browser.get('https://' + app.fqdn + '/F3');
        browser.findElement(by.xpath('//span[contains(text(), "bigfile.txt")]')).then(function () { done(); });
    });

    it('move to different location', function () {
        browser.manage().deleteAllCookies();
        execSync('cloudron install --wait --location ' + LOCATION + '2', { cwd: path.resolve(__dirname, '..'), stdio: 'inherit' });
        var inspect = JSON.parse(execSync('cloudron inspect'));
        app = inspect.apps.filter(function (a) { return a.location === LOCATION + '2'; })[0];
        expect(app).to.be.an('object');
    });

    it('can login using LDAP (email)', function (done) {
        browser.manage().deleteAllCookies();
        browser.get('https://' + app.fqdn);
        browser.findElement(by.xpath('//input[@name="ldap_username" and @type="text"]')).sendKeys(email);
        browser.findElement(by.xpath('//input[@name="ldap_password" and @type="password"]')).sendKeys(password);
        browser.findElement(by.xpath('//button[contains(text(), "Login or Register")]')).click();
        browser.wait(until.elementLocated(by.xpath('//span[contains(text(), "Differential")]')), 1000).then(function() { done(); });
    });

    it('displays correct clone url', function (done) {
        browser.get('https://' + app.fqdn + '/diffusion/1/');
        browser.findElement(by.xpath('//input[@type="text" and @class="diffusion-clone-uri"]')).getAttribute('value').then(function (cloneUrl) {
            expect(cloneUrl).to.be('git clone ssh://git@' + app.fqdn + ':29418/diffusion/1/testrepo.git');
            done();
        });
    });

    it('can clone the url', function (done) {
        var env = Object.create(process.env);
        env.GIT_SSH = __dirname + '/git_ssh_wrapper.sh';
        execSync('git clone ssh://git@' + app.fqdn + ':29418/diffusion/1/testrepo.git ' + repodir, { env: env });
        expect(fs.existsSync(repodir + '/newfile')).to.be(true);
        rimraf.sync(repodir);
        done();
    });

    it('has the task', function (done) {
        browser.get('https://' + app.fqdn + '/T1');
        browser.findElement(by.xpath('//span[contains(text(), "this is a task")]')).then(function () { done(); });
    });

    it('has the file', function (done) {
        browser.get('https://' + app.fqdn + '/F3');
        browser.findElement(by.xpath('//span[contains(text(), "bigfile.txt")]')).then(function () { done(); });
    });

    it('uninstall app', function () {
        execSync('cloudron uninstall --app ' + app.id, { cwd: path.resolve(__dirname, '..'), stdio: 'inherit' });
    });
});

