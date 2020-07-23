#!/bin/bash

cd services &> /dev/null

if [ $(whoami) != "root" ]
then
	echo $0 needs root
	exit 1
fi

for SERVICE in $(cat services-enable)
do
	echo "Enabling systemd service '$SERVICE'"
	systemctl enable $SERVICE
done
