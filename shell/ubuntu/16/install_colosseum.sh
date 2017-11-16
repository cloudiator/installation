#!/bin/bash

VERSION=0.2.0

# Read Password
echo -n "Password for mysql database:"
read -s MYSQLPW
echo

# Read Nodegroup
echo -n "NodeGroup (unique name for your cloudiator installation, should be dns compatible):"
read NODEGROUP
echo

#resolve public ip of host
#local_address=$(dig +short myip.opendns.com @resolver1.opendns.com)

# generate a random application secret
SECRET=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)

#download the colosseum master repo 
#git clone https://github.com/cloudiator/colosseum.git

echo 'creating folder axe-aggregator'
mkdir -p /opt/cloudiator

cd /opt/cloudiator
echo 'downloading latest binary, version ${VERSION}'
wget https://github.com/cloudiator/colosseum/releases/download/0.2.0/colosseum-0.2.0-SNAPSHOT.zip

unzip colosseum-$VERSION-SNAPSHOT.zip

cd colosseum-$VERSION-SNAPSHOT




#download default config
echo 'creating colosseum config'
mkdir conf
cd conf

wget https://raw.githubusercontent.com/cloudiator/colosseum/master/conf/application.conf

#create config file
touch config.conf

echo "include \"application.conf\"" >>  config.conf
echo "play.crypto.secret =\"$SECRET\"" >>  config.conf
echo "db.default.driver=org.mariadb.jdbc.Driver" >>  config.conf 
echo "db.default.url=\"mysql://root:$MYSQLPW@localhost/colosseum\"" >>  config.conf
echo "colosseum.nodegroup = \"$NODEGROUP\"" >> config.conf

echo 'downloading upstart config'
wget https://raw.githubusercontent.com/cloudiator/installation/master/shell/ubuntu/16/colosseum.service -O /etc/systemd/system/colosseum.service

echo 'starting colosseum'
systemctl enable colosseum.service

systemctl start colosseum.service 
echo 'control colosseum via COMMAND colosseum.service' 

#deprecated starting commands, now started via upstart
#start colosseum in foreground
#cd ../bin
#./colosseum -Dconfig.file=../conf/config.conf
#start colosseum in a screen, requires etcd running on localhost, otherwise change the respective args
#cd colosseum
#screen -S colosseum -d -m ../activator-dist-1.3.6/activator -Dconfig.file=conf/config.conf -Dlca.client.config.registry=etcdregistry -Dlca.client.config.registry.etcd.hosts=${local_address} run
#cd ..
