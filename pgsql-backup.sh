#!/bin/bash -x

#makes 'd' a directery marked with the date for the backups
d=db-backup-$(date "+%F")

#creates 'tmp_backup' directory containing 'd' as a child
mkdir -p /tmp_backup/$d

#backs up to the directory
pg_dump

