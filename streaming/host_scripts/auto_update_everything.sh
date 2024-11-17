#!/bin/bash
#Check for root access.
#if [ $(id -u) != "0" ]; then
#        echo "You must be the superuser to run this script."
#        exit 1
#fi
sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get autoremove -y
sudo apt-get autoclean
docker image prune -f
#docker volume prune -f
#docker container prune -f

echo "$(date +"%F %T") Device updated" | sudo tee -a /var/log/auto_update_everything.log
if [ -f /var/run/reboot-required ]
then
    ( sleep 2 ; sudo reboot now) &
fi
exit 0
