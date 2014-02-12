#!/usr/bin/env bash

# add ppa to install current versions of nodejs
apt-get install -y python-software-properties software-properties-common
add-apt-repository -y ppa:chris-lea/node.js
apt-get update

sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password password vagrant'
sudo debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password vagrant'

apt-get install -y apache2 php5
apt-get install -y mysql-client mysql-server
apt-get install -y vim git zip unzip curl wget
apt-get install -y memcached imagemagick
apt-get install -y php5-mysql php5-memcached php5-xdebug php5-curl php5-json

curl -sS https://getcomposer.org/installer | php
mv composer.phar /usr/local/bin/composer

apt-get install -y nodejs
npm install -g grunt-cli
npm install -g bower
npm install -g nodeunit

# Change apache to run as vagrant:vagrant
sed -i s/www-data/vagrant/ /etc/apache2/envvars