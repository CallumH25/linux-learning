#!/bin/bash
LOG_FILE="/var/log/create_users.log"

exec > >(while read line; do echo "[$(date '+%Y-%m-%d %H:%M:%S')] $line"; done | tee -a "$LOG_FILE")
exec 2>&1

echo "This is a script to create users, please follow the prompts to create a user."
echo "Please enter the username of the user you wish to create."
read username
useradd $username -m
echo "Now, set the password for the user, when they login for the first time they will need to change it to their own."
read -s password
echo "$username:$password" | chpasswd
passwd -e $username
echo "Creating users .ssh and .ssh/authorized_keys files."
mkdir -p /home/$username/.ssh
touch /home/$username/.ssh/authorized_keys
chmod 700 /home/$username/.ssh
chmod 600 /home/$username/.ssh/authorized_keys
chown $username:$username /home/$username/.ssh
chown $username:$username /home/$username/.ssh/authorized_keys
echo "User $username created successfully!"
