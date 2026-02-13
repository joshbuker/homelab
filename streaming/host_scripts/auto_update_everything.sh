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

# Update all docker images for all running compose projects
docker ps \
  --filter label=com.docker.compose.project \
  --format '{{.Label "com.docker.compose.project.working_dir"}}' \
| sort -u \
| while read dir; do
    docker compose -f "$dir/compose.yml" pull || \
    docker compose -f "$dir/docker-compose.yml" pull
  done

docker image prune -f
#docker volume prune -f
#docker container prune -f

if [ -f /var/run/reboot-required ]
then
    echo "$(date +"%F %T") Device updated - Reboot required, restarting in 2 seconds" | sudo tee -a /var/log/auto_update_everything.log
    ( sleep 2 ; sudo reboot now) &
else
    echo "$(date +"%F %T") Device updated - No reboot needed" | sudo tee -a /var/log/auto_update_everything.log
fi
exit 0
