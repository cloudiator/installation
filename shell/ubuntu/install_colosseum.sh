#!/bin/bash

VERSION=0.2.0

# Read Password
echo -n "Password for mysql database:"
read -s MYSQLPW
echo

# Read Nodegroup
echo -n "NodeGroup (unique name for your cloudiator installation, should be dns compatible)"
read NODEGROUP
echo

#resolve public ip of host
local_address=$(dig +short myip.opendns.com @resolver1.opendns.com)

# generate a random application secret
SECRET=$(cat /dev/urandom | tr -dc 'a-zA-Z0-9' | fold -w 32 | head -n 1)

#download the colosseum master repo 
#git clone https://github.com/cloudiator/colosseum.git

echo 'creating folder axe-aggregator'
mkdir -p ~/cloudiator

cd ~/cloudiator
echo 'downloading latest binary, version ${VERSION}'
wget https://omi-dev.e-technik.uni-ulm.de/jenkins/job/cloudiator-axe-aggregator/lastSuccessfulBuild/artifact/service/target/axe-aggregator-service-0.2.0-SNAPSHOT-jar-with-dependencies.jar

unzip /colosseum-$VERSION-SNAPSHOT.zip

cd colosseum-$VERSION-SNAPSHOT



#download default config
echo 'creating colosseum config'
mkdir conf
wget https://raw.githubusercontent.com/cloudiator/colosseum/master/conf/application.conf

#create config file
touch config.conf

echo "include \"application.conf\"" >>  config.conf
echo "play.crypto.secret =\"$SECRET\"" >>  config.conf
echo "db.default.driver=org.mariadb.jdbc.Driver" >>  config.conf 
echo "db.default.url=\"mysql://root:$MYSQLPW@localhost/colosseum\"" >>  config.conf
echo "colosseum.nodegroup = \"$NODEGROUP\"" >> config.conf

#start colosseum in a screen, requires etcd running on localhost, otherwise change the respective args
cd ../bin
./colosseum -Dconfig.file=../conf/config.conf
#cd colosseum
#screen -S colosseum -d -m ../activator-dist-1.3.6/activator -Dconfig.file=conf/config.conf -Dlca.client.config.registry=etcdregistry -Dlca.client.config.registry.etcd.hosts=${local_address} run
#cd ..
