#!/bin/bash

#check if this script is run as root
if [[ $USER != "root" ]]; then 
		echo "This script must be run as root!" 
		exit 1
fi 

#download kairosdb
wget https://github.com/kairosdb/kairosdb/releases/download/v0.9.4/kairosdb-0.9.4-6.tar.gz

#extract kairosdb
tar -xzf kairosdb-0.9.4-6.tar.gz

#start kairosdb (with default datastore H2) in background
nohup kairosdb/bin/kairosdb.sh run > kairos.out & 
