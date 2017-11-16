#!/bin/bash

MY_DIR="$(dirname "$0")"
source "$MY_DIR/util.sh"

# install java 8 and upate packages
add-apt-repository ppa:webupd8team/java -y

apt-get update

apt-get install -y wget



#disable ipv6 because at least for the ubuntu server (cloud image) 14.04 will bind the address to an ipv6 address as default 
#add these properties to the end of the /etc/sysctl.conf
echo "net.ipv6.conf.all.disable_ipv6 = 1" >> /etc/sysctl.conf
echo "net.ipv6.conf.default.disable_ipv6 = 1" >> /etc/sysctl.conf
echo "net.ipv6.conf.lo.disable_ipv6 = 1" >> /etc/sysctl.conf

sysctl -p

#install java 8
apt-get -y install openjdk-8-jdk

#install unzip
apt-get install unzip

#install dns-utils to resolve public IP
apt-get -y install dnsutils 


