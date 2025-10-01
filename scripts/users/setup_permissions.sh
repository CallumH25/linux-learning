#!/bin/bash
LOG_FILE="/var/log/setup_permissions.log"

exec > >(while read line; do echo "[$(date '+%Y-%m-%d %H:%M:%S')] $line"; done | tee -a "$LOG_FILE")
exec 2>&1

echo "please input the group you want to own files"

read grp

echo "please input the file path to the folders you wish to be owned by the group."

read filepath

chgrp $grp $filepath

chmod 775 $filepath

chmod g+s $filepath


