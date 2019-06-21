#!/bin/bash
{
#stop the satalite to prepair for backup
/usr/sbin/rhn-satellite stop
#switch user to oracle and execute backup script
su - oracle -c /Users/grantfalkner/bin/oracle-backup.sh
#restart redhat satalite
/usr/sbin/rhn-satellite start
} &> /dev/null
