#!/bin/sh

#check if this script is run as root
if [[ $USER != "root" ]]; then 
		echo "This script must be run as root!" 
		exit 1
fi

local_address=`hostname -I`

#download etcd
wget https://github.com/coreos/etcd/releases/download/v2.1.1/etcd-v2.1.1-linux-amd64.tar.gz -O etcd-v2.1.1-linux-amd64.tar.gz

tar xzvf etcd-v2.1.1-linux-amd64.tar.gz

#start etcd on default ports 2379, 4001
cd etcd-v2.1.1-linux-amd64
nohup ./etcd --advertise-client-urls "http://${local_address}:2379,http://${local_address}:4001" --listen-client-urls="http://${local_address}:2379,http://${local_address}:4001" > log.out &
