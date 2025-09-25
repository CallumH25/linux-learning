#!/bin/bash

echo "This is a script to create users, please follow the prompts to create a user."

echo "Please enter the username of the user you wish to create."

read username

useradd $username -m

echo "Now, set the password for the user, when they login for the first time they will need to change it to their own."

read -s password

echo "$username:$password" | chpasswd

passwd -e $username
