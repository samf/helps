#!/bin/bash

ORACLE_BACKUP=/Users/grantfalkner/bin/oracle-backup.sh

exec &> /dev/null

#stop the satalite to prepair for backup
/usr/sbin/rhn-satellite stop
#switch user to oracle and execute backup script
su - oracle -c $ORACLE_BACKUP
#restart redhat satalite
/usr/sbin/rhn-satellite start
