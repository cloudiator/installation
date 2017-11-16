#!/bin/bash

#install from source (deprecated)
#clone repo
#git clone https://github.com/cloudiator/axe-aggregator.git

#build project
#mvn clean install -f axe-aggregator/pom.xml

#starting the axe-aggregator, default config requires KairosDB at localhost:8080
#nohup java -jar axe-aggregator/service/target/axe-aggregator-service-0.2.0-SNAPSHOT-jar-with-dependencies.jar > /dev/null 2>&1 & 

#install from binary

echo 'creating folder axe-aggregator'
mkdir -p /opt/cloudiator/axe-aggregator

cd /opt/cloudiator/axe-aggregator
echo 'downloading latest binary'
wget  https://oss.sonatype.org/content/repositories/snapshots/io/github/cloudiator/axe/axe-aggregator-service/0.2.0-SNAPSHOT/axe-aggregator-service-0.2.0-20161026.111801-20-jar-with-dependencies.jar -O axe-aggregator-service-0.2.0-SNAPSHOT-jar-with-dependencies.jar

echo 'downloading systemd config'
wget https://raw.githubusercontent.com/cloudiator/installation/master/shell/ubuntu/16/axe-aggregator.service -O /etc/systemd/system/axe-aggregator.service

#download systemd start script
wget https://raw.githubusercontent.com/cloudiator/installation/master/shell/ubuntu/16/start_axe-aggregator.sh -O /opt/cloudiator/start_axe-aggregator.sh

echo 'starting axe-aggregator'
systemctl enable axe-aggregator.service

systemctl start axe-aggregator.service 

echo 'control axe-aggregator via COMMAND axe-aggregator.service ' 