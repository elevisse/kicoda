#!/bin/bash

apt update -y
apt install sshpass python3.9 -y
update-alternatives --install /usr/bin/python python /usr/bin/python3.9 1
unlink /usr/bin/python
ln -s /usr/bin/python3.9 /usr/bin/python
unlink /usr/bin/python3
ln -s /usr/bin/python3.9 /usr/bin/python3
pip install ansible
ansible-galaxy collection install ansible.posix
ansible-galaxy collection install community.docker
