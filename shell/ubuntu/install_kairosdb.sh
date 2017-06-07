#!/bin/bash

echo 'creating folder kairosdb'
mkdir -p /opt/cloudiator

cd /opt/cloudiator

#download kairosdb
echo 'downloading kairosdb'
wget https://github.com/kairosdb/kairosdb/releases/download/v1.1.1/kairosdb-1.1.1-1.tar.gz -O kairosdb.tar.gz

wget https://raw.githubusercontent.com/cloudiator/installation/master/shell/ubuntu/kairosdb.conf -O /etc/init/kairosdb.conf

#extract kairosdb
echo 'extracting kairosdb'
tar -xzf kairosdb.tar.gz

#start kairosdb (with default datastore H2) in background
#kairosdb/bin/kairosdb.sh start

start kairosdb

echo 'control kairosdb via COMMAND kairosdb'

