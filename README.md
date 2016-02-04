# Phabricator Cloudron App

This repository contains the Cloudron app package source for [Phabricator](http://phabricator.org/).

## Installation

[![Install](https://cloudron.io/img/button32.png)](https://cloudron.io/button.html?app=org.phabricator.cloudronapp)

or using the [Cloudron command line tooling](https://cloudron.io/references/cli.html)

```
cloudron install --appstore-id org.phabricator.cloudronapp
```

## Building

The app package can be built using the [Cloudron command line tooling](https://cloudron.io/references/cli.html).

```
cd phabricator-app

cloudron build
cloudron install
```

## Testing

The e2e tests are located in the `test/` folder and require [nodejs](http://nodejs.org/). They are creating a fresh build, install the app on your Cloudron, perform tests, backup, restore and test if the repos are still ok. The tests expect port 29418 to be available.

```
cd phabricator-app/test

npm install
USERNAME=<cloudron username> PASSWORD=<cloudron password> mocha --bail test.js
```

