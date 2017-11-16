#!/bin/bash

SERVICE=colosseum
VERSION=0.2.0
PUBLIC_IP=$(dig +short myip.opendns.com @resolver1.opendns.com)

/opt/cloudiator/colosseum-$VERSION-SNAPSHOT/bin/colosseum -Dconfig.file=/opt/cloudiator/colosseum-$VERSION-SNAPSHOT/conf/config.conf -Dlca.client.config.registry=etcdregistry -Dlca.client.config.registry.etcd.hosts=${PUBLIC_IP} 2>&1 >> /var/log/$SERVICE.log

