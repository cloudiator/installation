#!/bin/bash

echo "#### Installing dependencies ####"
./init.sh
echo "#### Installing etcd ####"
./install_etcd.sh
echo "#### Installing time-series database KairosDB ####"
./install_kairosdb_sh
echo "#### Installing time-series database MySQL ####"
./install_mysql.sh
echo "#### Installing colosseum ####"
./install_colosseum.sh
echo "#### Installing axe ####"
./install_axe_aggregator.sh
