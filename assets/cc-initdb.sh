#!/bin/bash

########################################################################
# ClassCat/OwnCloud2 Asset files
# Copyright (C) 2015 ClassCat Co.,Ltd. All rights reserved.
########################################################################

#--- HISTORY -----------------------------------------------------------
# 19-jun-15 : loop for waiting mysql running.
# 29-may-15 : Created.
#-----------------------------------------------------------------------

. /opt/env.sh

######################
### INITIALIZATION ###
######################

function init () {
  echo "ClassCat Info >> initialization db code for ClassCat/OwnCloud2"
  echo "Copyright (C) 2015 ClassCat Co.,Ltd. All rights reserved."
  echo ""
}


#############
### MYSQL ###
#############

function config_mysql () {

  RET=1
  while [[ RET -ne 0 ]]; do
    sleep 5
    mysql -u root -p${MYSQL_ROOT_PASSWORD} -h mysql -e "CREATE DATABASE ${MYSQL_OC_DBNAME}"
    RET=$?
  done

  mysql -u root -p${MYSQL_ROOT_PASSWORD} -h mysql -e "CREATE USER '${MYSQL_OC_USERNAME}'@'%' IDENTIFIED BY '${MYSQL_OC_PASSWORD}';"
  mysql -u root -p${MYSQL_ROOT_PASSWORD} -h mysql -e "GRANT ALL ON ${MYSQL_OC_DBNAME}.* TO '${MYSQL_OC_USERNAME}'@'%'"
}


### ENTRY POINT ###

init 

if [ -e /opt/cc-initdb_done ]; then
  echo "ClassCat Warning >> /opt/cc-initdb_done found, then skip wp configuration."
else
  config_mysql
  touch /opt/cc-initdb_done
fi

exit 0


### End of Script ###
