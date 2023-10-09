#!/bin/bash

apt update -y
apt install sshpass -y
mkdir -p /etc/ansible
echo "[myctnzdmachines]" > /etc/ansible/hosts
docker-compose -f /root/docker-compose.yml up -d
for n_node in {1..3}; do
    echo "10.1.1.$n_node node0$n_node" >> /etc/hosts
    echo "node0$n_node" >> /etc/ansible/hosts
    ssh-keyscan node0$n_node >> ~/.ssh/known_hosts
    sshpass -p ubuntu ssh-copy-id root@node0$n_node
done
pip install ansible
