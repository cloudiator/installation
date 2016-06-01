#!/bin/bash

#check if this script is run as root
if [[ $USER != "root" ]]; then 
		echo "This script must be run as root!" 
		exit 1
fi 

#install java 8 and upate packages
add-apt-repository ppa:webupd8team/java -y
apt-get update

apt-get install -y wget

apt-get install -y maven

#disable ipv6 because at least for the ubuntu server (cloud image) 14.04 will bind the address to an ipv6 address as default 
#add these properties to the end of the /etc/sysctl.conf
echo "net.ipv6.conf.all.disable_ipv6 = 1" >> /etc/sysctl.conf
echo "net.ipv6.conf.default.disable_ipv6 = 1" >> /etc/sysctl.conf
echo "net.ipv6.conf.lo.disable_ipv6 = 1" >> /etc/sysctl.conf

sysctl -p

#install java 8
echo oracle-java8-installer shared/accepted-oracle-license-v1-1 select true | /usr/bin/debconf-set-selections
apt-get install oracle-java8-installer -y

#install git
apt-get install git -y

#install typesafe activator
wget https://downloads.typesafe.com/typesafe-activator/1.3.6/typesafe-activator-1.3.6.zip?_ga=1.132158862.1231855203.1446477587 -O activator.zip
 
apt-get install unzip
unzip activator.zip

rm activator.zip

#export PATH=$PATH:activator-dist-1.3.6/
