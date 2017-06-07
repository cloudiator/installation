#!/bin/sh

echo 'creating folder cloudiator/etcd'
mkdir -p /opt/cloudiator/etcd

cd /opt/cloudiator
echo 'downloading etcd binary'
wget https://github.com/coreos/etcd/releases/download/v2.1.1/etcd-v2.1.1-linux-amd64.tar.gz -O etcd.tar.gz

mkdir etcd
tar xzvf etcd.tar.gz -C etcd --strip-components=1

echo 'downloading upstart config'
wget https://raw.githubusercontent.com/cloudiator/installation/master/shell/ubuntu/etcd.conf -O /etc/init/etcd.conf

echo 'starting etcd'
start etcd

echo 'control etcd via COMMAND etcd' 


#deprecated, now started as service
#start etcd on default ports 2379, 4001
#local_address=$(ip route get 8.8.8.8 | awk '{print $NF; exit}')
#nohup ./etcd/etcd --advertise-client-urls "http://${local_address}:2379,http://${local_address}:4001" --listen-client-urls="http://${local_address}:2379,http://${local_address}:4001" > log.out &
