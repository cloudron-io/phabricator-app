FROM cloudron/base:0.8.0
MAINTAINER Girish Ramakrishnan <support@cloudron.io>

RUN mkdir -p /app/code
WORKDIR /app/code

RUN apt-get update && \
    apt-get install -y python-pygments subversion mercurial openssh-server && \
    rm -r /var/cache/apt /var/lib/apt/lists

# by default, git account is created as inactive which prevents login via openssh
# https://github.com/gitlabhq/gitlabhq/issues/5304
RUN adduser --disabled-login --gecos 'Git' git && passwd -d git
RUN adduser --disabled-login --gecos 'Phabricator Deamon' phd

# https://secure.phabricator.com/book/phabricator/article/diffusion_hosting
RUN echo "git ALL=(phd) SETENV: NOPASSWD: /usr/bin/git-upload-pack, /usr/bin/git-receive-pack, /usr/bin/hg, /usr/bin/svnserve" >> /etc/sudoers

# (stable) Promote 2016 Week 4
RUN mkdir libphutil && \
    cd libphutil && \
    curl -L https://github.com/phacility/libphutil/archive/9c472e7c9b64395424c6cd25734bf239cb3c113d.tar.gz | tar -xzf - --strip-components 1

# (stable) Promote 2016 Week 7
RUN mkdir arcanist && \
    cd arcanist && \
    curl -L https://github.com/phacility/arcanist/archive/ed476cf8489c4bf41b7a0075f15d40820d640fe4.tar.gz | tar -xzf - --strip-components 1

# if you update this, make a new dump.sql as well
# (stable) Promote 2016 Week 7
RUN mkdir phabricator && \
    cd phabricator && \
    curl -L https://github.com/phacility/phabricator/archive/70c679110e1d4632d19ca160379f83f6f20d79d1.tar.gz | tar -xzf - --strip-components 1
ADD local.json.template /app/code/phabricator/conf/local/local.json.template
RUN ln -s /run/phabricator/local.json /app/code/phabricator/conf/local/local.json 

# configure apache
RUN rm /etc/apache2/sites-enabled/*
RUN sed -e 's,^ErrorLog.*,ErrorLog "|/bin/cat",' -i /etc/apache2/apache2.conf
RUN sed -e "s,MaxSpareServers[^:].*,MaxSpareServers 5," -i /etc/apache2/mods-available/mpm_prefork.conf

RUN a2disconf other-vhosts-access-log
ADD apache2-phabricator.conf /etc/apache2/sites-available/phabricator.conf
RUN ln -sf /etc/apache2/sites-available/phabricator.conf /etc/apache2/sites-enabled/phabricator.conf
RUN echo "Listen 8000" > /etc/apache2/ports.conf

# configure mod_php
RUN a2enmod php5
RUN a2enmod rewrite
RUN sed -e 's/^upload_max_filesize = .*/upload_max_filesize = 32M/' \
        -e 's/^post_max_size = .*/post_max_size = 32M/' \
        -e 's/^memory_limit = .*/memory_limit = -1/' \
        -e 's,;session.save_path.*,session.save_path = "/run/phabricator/sessions",' \
        -e 's/;opcache.validate_timestamps=1/opcache.validate_timestamps=0/' \
        -i /etc/php5/apache2/php.ini

ADD dump_71bda66870d8ef832f.sql /app/code/dump_71bda66870d8ef832f.sql
ADD start.sh /app/code/start.sh

ADD sshd_config /app/code/sshd_config
ADD phabricator-ssh-hook.sh /app/code/phabricator-ssh-hook.sh

# configure supervisor
RUN sed -e 's,^logfile=.*$,logfile=/run/phabricator/supervisord.log,' -i /etc/supervisor/supervisord.conf
ADD supervisor/ /etc/supervisor/conf.d/

CMD [ "/app/code/start.sh" ]

