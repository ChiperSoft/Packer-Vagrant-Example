#!/bin/bash

cat "/vagrant/provisioning/self-promotion.txt"

if [[ -a /etc/apache2/sites-enabled/000-default.conf ]]; then
    echo "Removing default apache config."
    unlink /etc/apache2/sites-enabled/000-default.conf
fi

echo "Copying v2 apache config..."
cp /vagrant/provisioning/files/etc/apache2/sites-enabled/vagrant.conf /etc/apache2/sites-enabled/vagrant.conf

echo "Copying crontab..."
cp /vagrant/provisioning/files/etc/crontab /etc/crontab

echo "Copying bashrc..."
cp /vagrant/provisioning/files/bashrc /home/vagrant/.bashrc

echo "Copying php configs..."
cp /vagrant/provisioning/files/etc/php5/apache2/conf.d/vagrant.ini /etc/php5/apache2/conf.d/vagrant.ini
cp /vagrant/provisioning/files/etc/php5/cli/conf.d/vagrant.ini /etc/php5/cli/conf.d/vagrant.ini

service apache2 restart