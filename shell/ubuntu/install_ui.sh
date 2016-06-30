#!/bin/bash

#check if this script is run as root
if [[ $USER != "root" ]]; then
		echo "This script must be run as root!"
		exit 1
fi

apt-get install apache2 php5 php5-curl

a2enmod rewrite && service apache2 restart

git clone https://tuleap.ow2.org/plugins/git/paasage/executionware_ui.git

rm -rf /var/www/html/executionware_ui
mv executionware_ui /var/www/html/

chown www-data:www-data /var/Www/html/executionware_ui
