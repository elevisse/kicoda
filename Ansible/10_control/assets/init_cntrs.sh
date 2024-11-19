#!/bin/bash
apt update -y
apt install sshpass python3.9 ca-certificates curl -y
update-alternatives --install /usr/bin/python python /usr/bin/python3.9 1

unlink /usr/bin/python
ln -s /usr/bin/python3.9 /usr/bin/python
unlink /usr/bin/python3
ln -s /usr/bin/python3.9 /usr/bin/python3

for pkg in docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc; do apt remove $pkg -y; done
install -m 0755 -d /etc/apt/keyrings
curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
chmod a+r /etc/apt/keyrings/docker.asc

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  tee /etc/apt/sources.list.d/docker.list > /dev/null

apt update -y
apt install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y -q -o DPkg::Options::=--force-confdef

pip install ansible cffi
ansible-galaxy collection install ansible.posix
ansible-galaxy collection install community.docker
