FROM cloudron/base:0.8.0
MAINTAINER Girish Ramakrishnan <support@cloudron.io>

RUN mkdir -p /app/code
WORKDIR /app/code

RUN apt-get update && \
    apt-get install python-pygments && \
    rm -r /var/cache/apt /var/lib/apt/lists

RUN mkdir libphutil && \
    cd libphutil && \
    curl -L https://github.com/phacility/libphutil/archive/f43291e99d36045bc459e5133454c0d8fd8768ea.tar.gz | tar -xzf - --strip-components 1

# cli for phabricator
RUN mkdir arcanist && \
    cd arcanist && \
    curl -L https://github.com/phacility/arcanist/archive/57f6fb59d73994d90cd94143787424ce0fdbf73b.tar.gz | tar -xzf - --strip-components 1

RUN mkdir phabricator && \
    cd phabricator && \
    curl -L https://github.com/phacility/phabricator/archive/e4372e1276fddc5c19ae904062f86d625d10eaa4.tar.gz | tar -xzf - --strip-components 1
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

ADD start.sh /app/code/start.sh

CMD [ "/app/code/start.sh" ]

