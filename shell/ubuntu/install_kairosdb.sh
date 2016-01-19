#!/bin/bash

#check if this script is run as root
if [[ $USER != "root" ]]; then 
		echo "This script must be run as root!" 
		exit 1
fi 

#download kairosdb
wget https://github.com/kairosdb/kairosdb/releases/download/v1.1.1/kairosdb-1.1.1-1.tar.gz

#extract kairosdb
tar -xzf kairosdb-1.1.1-1.tar.gz

#start kairosdb (with default datastore H2) in background
kairosdb/bin/kairosdb.sh start