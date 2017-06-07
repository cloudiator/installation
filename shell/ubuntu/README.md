# Distribution: Ubuntu

These scripts are tested against Ubunut Server 14.04 LTS

# Installation
All scripts should be run with root privileges

The scripts will install all required tools to the folder: /opt/cloudiator

Run the scripts in the order:

1. init.sh
2. install_etcd.sh
3. install kairosdb_sh
4. install_mysql.sh (specify first a secure password in this script!)
5. install_colosseum.sh (will be started in a screen "colosseum")
6. install_axe_aggregator.sh

