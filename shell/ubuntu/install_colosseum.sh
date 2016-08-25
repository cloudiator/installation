#!/bin/bash

# Read Password
echo -n "Password for mysql database:"
read -s MYSQLPW
echo

#check if this script is run as root
if [[ $USER != "root" ]]; then 
		echo "This script must be run as root!" 
		exit 1
fi 

#resolve public ip of host
local_address=$(dig +short myip.opendns.com @resolver1.opendns.com)

#download the colosseum master repo 
git clone https://github.com/cloudiator/colosseum.git

#create config file
touch colosseum/conf/config.conf

echo "include \"application.conf\"" >>  colosseum/conf/config.conf
echo  echo "application.secret=\"sandlandnpoj33qkpsajfdpjd30jd\"" >>  colosseum/conf/config.conf 
echo "db.default.driver=org.mariadb.jdbc.Driver" >>  colosseum/conf/config.conf 
echo "db.default.url=\"mysql://root:topsecret@localhost/colosseum\"" >>  colosseum/conf/config.conf 

#start colosseum in a screen, requires etcd running on localhost, otherwise change the respective args
cd colosseum
screen -S colosseum -d -m ../activator-dist-1.3.6/activator -Dconfig.file=conf/config.conf -Dlca.client.config.registry=etcdregistry -Dlca.client.config.registry.etcd.hosts=${local_address} run
