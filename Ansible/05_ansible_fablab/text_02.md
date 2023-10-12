installer les collections complémentaires

Actions à réaliser :
- installer la collection ansible.posix
- installer la collection community.docker

Sources :
- [docker_compose](https://docs.ansible.com/ansible/latest/collections/community/docker/docker_compose_module.html#community-docker-docker-compose-module-manage-multi-container-docker-applications-with-docker-compose)
- [ansible.posix](https://docs.ansible.com/ansible/latest/collections/ansible/posix/authorized_key_module.html)
<br>

<details>

<summary>Solution</summary>
Installer les collections :
```plain
ansible-galaxy collection install ansible.posix
```{{exec}}
```plain
ansible-galaxy collection install community.docker
```{{exec}}
