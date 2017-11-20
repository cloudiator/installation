#!/bin/bash

#force php5 
add-apt-repository ppa:ondrej/php -y
sudo apt-get update

apt-get install -y apache2 php5.6 php5.6-curl php5.6-xml


a2enmod rewrite

git clone https://github.com/cloudiator/ui.git

rm -f /etc/apache2/sites-enabled/*
cp ui.conf /etc/apache2/sites-enabled/

rm -rf /var/www/html/ui
mv ui /var/www/html/

chown www-data:www-data /var/www/html/ui

service apache2 restart


