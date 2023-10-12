#!/bin/bash

apt update -y
apt install sshpass -y
pip install ansible
ansible-galaxy collection install ansible.posix
ansible-galaxy collection install community.docker
