#!/bin/bash
#openstack-cli container wrapper to pickup required environment files.

if [[ ! -x $(which docker) ]]; then
	echo "Docker executable doesn't seem to exist on your system."
	exit 1
fi

if [[ -z "$OS_PROJECT_NAME" ]]; then
	echo ""
	echo "Unable to find environment variables."
	echo "Go to https://openstack.cloudvps.com and login"
	echo "Go to access and security, API Access"
	echo "Download Openstack RC File V3"
	echo "Before running this script again source Openstack RC FIle like"
	echo "source 'ABCD000543 compute-user-openrc.sh'"
	echo ""
	echo "In the container you should be able to type 'nova list' to talk to the API"
	echo "If this doesn't work try sourcing the RC file again and provide your password"
	echo ""
else
	docker run -ti \
	-e OS_PROJECT_ID="$OS_PROJECT_ID" \
	-e OS_PROJECT_NAME="$OS_PROJECT_NAME" \
	-e OS_USERNAME="$OS_USERNAME" \
	-e OS_PASSWORD="$OS_PASSWORD" \
	docker.io/pblaas/openstack-cli:latest

fi

