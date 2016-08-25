#!/bin/bash

#check if this script is run as root
if [[ $USER != "root" ]]; then
		echo "This script must be run as root!"
		exit 1
fi

echo "#### Installing dependencies ####"
./init.sh
echo "#### Installing etcd ####"
./install_etcd.sh
echo "#### Installing time-series database KairosDB ####"
./install_kairosdb.sh
echo "#### Installing MySQL ####"
./install_mysql.sh
echo "#### Installing colosseum ####"
./install_colosseum.sh
echo "#### Installing axe ####"
./install_axe_aggregator.sh
echo "#### Installing ui ####"
./install_ui.sh
