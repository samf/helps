#!/bin/bash -x

#call using comand "su - OWNER - c /tmp/grant/pgdb_backup.sh DATABASE_NAME"

#t = title, d = date, 1 = database name argument

d=$(date "+%F")
t=/tmp_backup_$1
mkdir -p $t/$d
echo > $t/$d/${1}.bak
pg_dump $1 > $t/$d/${1}.bak
