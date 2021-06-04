#!/bin/bash
#A simple script to automate the rsync process

#Get colors
RED="$(tput setaf 1 2>/dev/null || echo ' ')"
GREEN="$(tput setaf 2 2>/dev/null || echo ' ')"
NO_COLOR="$(tput sgr0 2>/dev/null || echo ' ')"
echo "Make sure SSH is enabled on the client side"


#Begin sync
#Get user parameters
read -p "Enter remote system username " REMOTE_HOST_USER
read -p "Enter remote system IPv4: " REMOTE_HOST
read -p "Enter client diretory to write to: " REMOTE_DIR
read -p "Enter local file or directory: " LOCAL_FILE

#Check if SSH is running
if ! [[ $(sudo nmap -p 22 $REMOTE_HOST | grep "open" ) ]]; 
then
	echo -e "${RED}SSH server not running, sync will fail\n Exiting now${NO_COLOR}"
	exit 1
fi

sudo rsync -a ${LOCAL_FILE} ${REMOTE_HOST_USER}@${REMOTE_HOST}:${REMOTE_DIR}

echo "${GREEN} All done ${NO_COLOR}"

exit 0




