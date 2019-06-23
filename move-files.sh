#!/bin/bash

#exec &> /dev/null

#rsyncs the backup files to LaCie, an external hard drive opt file sent to opt_backups and
#var file sent to var_backups

backupdir=/tmp_backup/db-backup-$(date "+%F")

rsync -n -avz $backupdir/var --exclude atlassian/application-data/bamboo/xml-data /Volumes/LaCie/var_backups
rsync -n -avz $backupdir/opt /Volumes/LaCie/opt_backups
