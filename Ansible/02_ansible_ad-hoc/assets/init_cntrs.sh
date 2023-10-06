#!/bin/bash

apt update -y
apt install sshpass -y
docker-compose -f /root/docker-compose.yml up -d
echo "10.1.1.1 node01" >> /etc/hosts
echo "10.1.1.2 node02" >> /etc/hosts
echo "10.1.1.3 node03" >> /etc/hosts
pip install ansible
mkdir -p /etc/ansible
echo "[myctnzdmachines]" > /etc/ansible/hosts
echo "node01" >> /etc/ansible/hosts
echo "node02" >> /etc/ansible/hosts
echo "node03" >> /etc/ansible/hosts
ssh -o HostKeyAlias=node01 root@node01
ssh -o HostKeyAlias=node02 root@node02
ssh -o HostKeyAlias=node03 root@node03
sshpass -p ubuntu ssh-copy-id root@node01
sshpass -p ubuntu ssh-copy-id root@node02
sshpass -p ubuntu ssh-copy-id root@node03
