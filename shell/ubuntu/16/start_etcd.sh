#!/bin/sh

LOCAL_ADDRESS=$(ip route get 8.8.8.8 | awk '{print $NF; exit}') 
/opt/cloudiator/etcd/etcd --advertise-client-urls "http://${LOCAL_ADDRESS}:2379,http://${LOCAL_ADDRESS}:4001" --listen-client-urls="http://${LOCAL_ADDRESS}:2379,http://${LOCAL_ADDRESS}:4001" 2>&1 >> /var/log/etcd.log