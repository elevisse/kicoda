installer une librairie complémentaire

Actions à réaliser :
- installer le module communautaire community.docker

Source : [docker_compose](https://docs.ansible.com/ansible/latest/collections/community/docker/docker_compose_module.html#community-docker-docker-compose-module-manage-multi-container-docker-applications-with-docker-compose)
<br>

<details>

<summary>Solution</summary>
Installer le module :
```plain
ansible-galaxy collection install community.docker
```{{exec}}
