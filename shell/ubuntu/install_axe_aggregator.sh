#!/bin/bash

#TODO: initialise a version number, currently 0.2.0

#check if this script is run as root
if [[ $USER != "root" ]]; then 
		echo "This script must be run as root!" 
		exit 1
fi 

#clone repo
git clone https://github.com/cloudiator/axe-aggregator.git

#build project
mvn clean install -f axe-aggregator/pom.xml

#starting the axe-aggregator, default config requires KairosDB at localhost:8080
nohup java -jar axe-aggregator/service/target/axe-aggregator-service-0.2.0-SNAPSHOT-jar-with-dependencies.jar > axe-aggregator.out & 
