#!/bin/sh

local_address=$(dig +short myip.opendns.com @resolver1.opendns.com)

#download etcd
wget https://github.com/coreos/etcd/releases/download/v2.1.1/etcd-v2.1.1-linux-amd64.tar.gz -O etcd.tar.gz

mkdir etcd
tar xzvf etcd.tar.gz -C etcd --strip-components=1

#start etcd on default ports 2379, 4001
nohup ./etcd/etcd --advertise-client-urls "http://${local_address}:2379,http://${local_address}:4001" --listen-client-urls="http://${local_address}:2379,http://${local_address}:4001" > log.out &
