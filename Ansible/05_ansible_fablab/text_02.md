installer les collections complémentaires

Actions à réaliser :
- installer la collection ansible.posix
- installer la collection community.docker

Sources :
- [docker_compose](https://docs.ansible.com/ansible/latest/collections/community/docker/docker_compose_v2_module.html#ansible-collections-community-docker-docker-compose-v2-module)
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

</details>
