#!/bin/bash

#please chose here your mysql root passowrd carefully
MYSQLPW="topsecret"

#check if this script is run as root
if [[ $USER != "root" ]]; then 
		echo "This script must be run as root!" 
		exit 1
fi 

#download the colosseum master repo 
wget https://github.com/cloudiator/colosseum/archive/master.zip -O colosseum.zip

unzip colosseum.zip

#create config file
touch colosseum-master/conf/config.conf

echo "include \"application.conf\"" >>  colosseum-master/conf/config.conf
echo  echo "application.secret=\"sandlandnpoj33qkpsajfdpjd30jd\"" >>  colosseum-master/conf/config.conf 
echo "db.default.driver=org.mariadb.jdbc.Driver" >>  colosseum-master/conf/config.conf 
echo "db.default.url=\"mysql://root:topsecret@localhost/colosseum\"" >>  colosseum-master/conf/config.conf 

#start colosseum in a screen
cd colosseum-master
screen -S colosseum -d -m ../activator-dist-1.3.6/activator -Dconfig.file=conf/config.conf run
