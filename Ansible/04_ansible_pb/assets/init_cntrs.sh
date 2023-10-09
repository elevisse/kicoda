#!/bin/bash

apt update -y
apt install sshpass -y

mkdir -p /etc/ansible
echo '[frontal]' > /etc/ansible/hosts
echo "node01" >> /etc/ansible/hosts
echo "node02" >> /etc/ansible/hosts
echo '[middle]' > /etc/ansible/hosts
echo "node03" >> /etc/ansible/hosts
echo '[back]' > /etc/ansible/hosts
echo "node04" >> /etc/ansible/hosts

docker-compose -f /root/docker-compose.yml up -d
for n_node in {1..4}; do
    echo "10.1.1.$n_node node0$n_node" >> /etc/hosts
    ssh-keyscan node0$n_node >> ~/.ssh/known_hosts
    if [ $n_node=2 ]; then
        sshpass -p root ssh-copy-id root@node0$n_node
    else
        sshpass -p ubuntu ssh-copy-id root@node0$n_node
    fi
done
pip install ansible
