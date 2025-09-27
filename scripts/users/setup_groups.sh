#!/bin/bash
exec > >(tee -a "/var/log/$(basename "$0" .sh).log") 2>&1

echo "This script can add groups or add users to groups, follow along with the prompts."

echo "Do you want to create a group? (y/n)"

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
