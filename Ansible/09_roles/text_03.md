# Créer un rôle local pour la gestion docker-compose

Actions à réaliser :
- modification du playbook pour appeler les rôles
- installer la collection ansible.posix
- installer la collection community.docker
- tester le playbook

Sources :
- [docker_compose](https://docs.ansible.com/ansible/latest/collections/community/docker/docker_compose_module.html#community-docker-docker-compose-module-manage-multi-container-docker-applications-with-docker-compose)
- [ansible.posix](https://docs.ansible.com/ansible/latest/collections/ansible/posix/authorized_key_module.html)

<br>

<details>

<summary>Solution</summary>

## Actions 

Modifier le playbook/main.yml pour appeler les rôles :
```plain
---

# Ce playbook crée un lab pour ansible ad-hoc via ansible
- name: Mise en place reseau local et des images docker
  hosts: local
  roles:
  - role: docker_compose

# Cette partie gère l'obtention des clés
- name: Mise en place reseau local et des images docker
  hosts: nodes
  gather_facts: no
  roles:
  - role: ssh_hosts

```

Installer les collections :
```plain
ansible-galaxy collection install ansible.posix
```{{exec}}
```plain
ansible-galaxy collection install community.docker
```{{exec}}

Tester le fichier palybook :
```plain
ansible-playbook playbook/main.yml -i inventory --ask-vault-pass
```{{exec}}

</details>
