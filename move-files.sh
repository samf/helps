#!/bin/bash

#call using comand "su - OWNER - c /tmp/grant/move-files.sh DATABASE_NAME"
d=$(date "+%F")
t=/tmp_backup_$1
p=$t/$d/${1}.bak
rsync -n -avz $p /media/LaCie
