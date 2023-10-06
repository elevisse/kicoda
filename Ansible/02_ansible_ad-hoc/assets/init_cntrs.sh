#!/bin/bash

apt update -y
apt upgrade -y
apt install sshpass -y
docker-compose -f /root/docker-compose.yml up -d
echo "10.1.1.1 node01" >> /etc/hosts
echo "10.1.1.2 node02" >> /etc/hosts
echo "10.1.1.3 node03" >> /etc/hosts
pip install ansible
echo "10.1.1.1 node01" > /etc/ansible/hosts
echo "10.1.1.2 node02" >> /etc/ansible/hosts
echo "10.1.1.3 node03" >> /etc/ansible/hosts
touch /root/.finished