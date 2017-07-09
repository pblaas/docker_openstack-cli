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


#fork new shell which contain set variables.
if [ "$1" ]; then
	exec ssh-agent /bin/bash -c "$1" 
else
	exec ssh-agent /bin/bash
fi
