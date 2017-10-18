#!/bin/bash

apt-get install -y apache2 php5 php5-curl

a2enmod rewrite

git clone https://github.com/cloudiator/ui.git

rm -f /etc/apache2/sites-enabled/*
cp ui.conf /etc/apache2/sites-enabled/

rm -rf /var/www/html/executionware_ui
mv executionware_ui /var/www/html/

chown www-data:www-data /var/www/html/executionware_ui

service apache2 restart


