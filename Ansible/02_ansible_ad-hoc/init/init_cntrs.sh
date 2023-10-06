#!/bin/bash

apt update -y
apt upgrade -y
apt install sshpass -y
docker-compose up -d
sshpass -p ubuntu ssh-copy-id root@10.1.1.1
sshpass -p ubuntu ssh-copy-id root@10.1.1.2
sshpass -p ubuntu ssh-copy-id root@10.1.1.3
echo "10.1.1.1 node01" >> /etc/hosts
echo "10.1.1.2 node02" >> /etc/hosts
echo "10.1.1.3 node03" >> /etc/hosts
