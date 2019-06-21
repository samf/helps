#!/bin/bash

#rsyncs the backup files to LaCie, an external hard drive opt file sent to opt_backups and
#var file sent to var_backups

rsync -avz /tmp_backup/db-backup-$(date "+%F")/var /Volumes/LaCie/var_backups
rsync -avz /tmp_backup/db-backup-$(date "+%F")/opt /Volumes/LaCie/opt_backups
&> /dev/null
