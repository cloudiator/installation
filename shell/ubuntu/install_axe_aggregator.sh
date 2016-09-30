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
mkdir -p ~/cloudiator/axe-aggregator

cd ~/cloudiator/axe-aggregator
echo 'downloading latest binary'
wget https://omi-dev.e-technik.uni-ulm.de/jenkins/job/cloudiator-axe-aggregator/lastSuccessfulBuild/artifact/service/target/axe-aggregator-service-0.2.0-SNAPSHOT-jar-with-dependencies.jar

echo 'downloading upstart config'
wget https://raw.githubusercontent.com/cloudiator/installation/master/shell/ubuntu/axe-aggregator.conf -O /etc/init/axe-aggregator.conf

echo 'starting axe-aggregator'
start axe-aggregator

echo 'control axe-aggregator via COMMAND axe-aggregator' 