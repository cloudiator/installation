#!/bin/bash

#check if this script is run as root
if [[ $USER != "root" ]]; then
		echo "This script must be run as root!"
		exit 1
fi

apt-get install apache2 php5 php5-curl

a2enmod rewrite

git clone https://tuleap.ow2.org/plugins/git/paasage/executionware_ui.git

rm -f /etc/apache2/sites-enabled/*
cp ui.conf /etc/apache2/sites-enabled/

rm -rf /var/www/html/executionware_ui
mv executionware_ui /var/www/html/

chown www-data:www-data /var/www/html/executionware_ui

service apache2 restart


