#!/bin/bash
exec > >(tee -a "/var/log/$(basename "$0" .sh).log") 2>&1

echo "This script adds the default groups, and allows you to create groups yourself."

groupadd developers
groupadd admins
groupadd fakecompany

mkdir -p /shared/developers
mkdir -p /shared/admins
mkdir -p /shared/fakecompany

chgrp developers /shared/developers
chgrp admins /shared/admins
chgrp fakecompany /shared/fakecompany

chmod -R 770 /shared/developers
chmod -R 770 /shared/admins
chmod -R 770 /shared/fakecompany 

echo "Do you want to create a group yourself? (y/n)"

read decision

if [ "$decision" = "y" ]; then

        echo "Please choose a group name to create."

        read groupname

        groupadd "$groupname"

fi

echo "To add users to a group, please enter the users name now."

read user

echo "To add "$user" to a group, please enter the groups name now."

read group

usermod -g "$group" "$user"

echo "The user should now be in the correct group."
