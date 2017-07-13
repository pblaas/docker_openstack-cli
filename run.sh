#!/bin/bash

if [ -z "$OS_USERNAME" ]; then
echo "Please enter your OpenStack username : "
read -r OS_USERNAME
export OS_USERNAME=$OS_USERNAME
fi

if [ -z "$OS_PROJECT_NAME" ]; then
echo "Please enter your OpenStack Project Name : "
read -r OS_PROJECT_NAME
export OS_PROJECT_NAME=$OS_PROJECT_NAME
fi

if [ -z "$OS_PASSWORD" ]; then
echo "Please enter your OpenStack Password: "
read -sr OS_PASSWORD
export OS_PASSWORD=$OS_PASSWORD
fi

export OS_TENANT_NAME=$OS_PROJECT_NAME
export OS_TENANT_ID=$OS_PROJECT_ID

# used for mapping ssh key files.
if [ -d "/root/.ssh2" ]; then
	scp -r /root/.ssh2 /root/.ssh
	chown root:root /root/.ssh
	chmod -R 0700 /root
fi	

#exporting more usefull shell.
export PS1="\[\033[1;90m\][\$(date +%H%M)]\[\033[1;92m\][\[\033[1;31m\]\u\[\033[1;92m\]:\[\033[1;37m\]\w\[\033[1;92m\]]$\[\033[0m\] "

#fork new shell which contain set variables.
if [ "$1" ]; then
	exec ssh-agent /bin/bash -c "$1" 
else
	exec ssh-agent /bin/bash
fi
