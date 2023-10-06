#!/bin/bash

apt update -y
apt install sshpass -y
docker-compose -f /root/docker-compose.yml up -d
echo "10.1.1.1 node01" >> /etc/hosts
echo "10.1.1.2 node02" >> /etc/hosts
echo "10.1.1.3 node03" >> /etc/hosts
pip install ansible
mkdir -p /etc/ansible
ssh-keyscan node01 >> ~/.ssh/known_hosts
ssh-keyscan node02 >> ~/.ssh/known_hosts
ssh-keyscan node03 >> ~/.ssh/known_hosts
sshpass -p ubuntu ssh-copy-id root@node01
sshpass -p ubuntu ssh-copy-id root@node02
sshpass -p ubuntu ssh-copy-id root@node03
