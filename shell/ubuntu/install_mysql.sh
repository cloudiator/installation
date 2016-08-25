#!/bin/bash

# Read Password
echo -n "Password for mysql database:"
read -s MYSQLPW
echo

#set default root password for automated installation
debconf-set-selections <<< 'mysql-server mysql-server/root_password password '$MYSQLPW
debconf-set-selections <<< 'mysql-server mysql-server/root_password_again password '$MYSQLPW
apt-get -y install mysql-server

#create colosseum database
mysql -u root -p$MYSQLPW -e "CREATE DATABASE colosseum;"
