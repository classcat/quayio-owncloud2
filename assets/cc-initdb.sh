#!/bin/bash

########################################################################
# ClassCat/OwnCloud2 Asset files
# Copyright (C) 2015 ClassCat Co.,Ltd. All rights reserved.
########################################################################

#--- HISTORY -----------------------------------------------------------
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
  mysql -u root -p${MYSQL_ROOT_PASSWORD} -h mysql -e "CREATE DATABASE ${MYSQL_OC_DBNAME}"
  mysql -u root -p${MYSQL_ROOT_PASSWORD} -h mysql -e "CREATE USER '${MYSQL_OC_USERNAME}'@'%' IDENTIFIED BY '${MYSQL_OC_PASSWORD}';"
  mysql -u root -p${MYSQL_ROOT_PASSWORD} -h mysql -e "GRANT ALL ON ${MYSQL_OC_DBNAME}.* TO '${MYSQL_OC_USERNAME}'@'%'"
}


### ENTRY POINT ###

init 
config_mysql

exit 0


### End of Script ###
