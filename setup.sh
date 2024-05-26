#!/bin/sh

# Install Docker
sudo apt install apt-transport-https ca-certificates curl software-properties-common
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo apt-key add -
sudo add-apt-repository "deb [arch=amd64] https://download.docker.com/linux/ubuntu focal stable"
apt-cache policy docker-ce
sudo apt update
sudo apt install docker-ce
sudo apt install docker-compose

# Running Docker Service
docker-compose up -d --build

# Add Cronjob For Backup Database BTools
sudo crontab -l | { echo "0 0 * * 1,5 curl http://localhost/backup"; } | crontab -