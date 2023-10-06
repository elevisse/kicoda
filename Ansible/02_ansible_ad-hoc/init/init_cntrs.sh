#!/bin/bash

apt update -y
apt upgrade -y
apt install sshpass -y
docker-compose -f /root/docker-compose.yml up -d
echo "10.1.1.1 node01" >> /etc/hosts
echo "10.1.1.2 node02" >> /etc/hosts
echo "10.1.1.3 node03" >> /etc/hosts
sshpass -p ubuntu ssh-copy-id root@node01
sshpass -p ubuntu ssh-copy-id root@node02
sshpass -p ubuntu ssh-copy-id root@node03
touch /root/.finished
