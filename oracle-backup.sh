#!/bin/bash

#makes 'd' a directery marked with the date for the backups excludes large xml data file
d=db-backup-$(date "+%F") --exclude /var/atlassian/application-data/bamboo/xml-data

#creates 'tmp_backup' directory containing 'd' as a child
mkdir -p /tmp_backup/$d;

#backs up to the directory excluding the xml-data (too large)
db-control backup /tmp_backup/$d
