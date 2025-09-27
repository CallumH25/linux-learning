#!/bin/bash
exec > >(tee -a "/var/log/$(basename "$0" .sh).log") 2>&1

echo "please input the group you want to own files"

read grp

echo "please input the file path to the folders you wish to be owned by the group."

read filepath

chgrp $grp $filepath

chmod 775 $filepath

chmod g+s $filepath


