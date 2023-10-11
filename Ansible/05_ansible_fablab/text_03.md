# Création playbook : partie locale

Actions à réaliser :
- créer le playbook première partie docker-compose
- se baser sur le fichier ~/docker-compose_sample.yml
- utiliser les variables de l'inventaire
- utiliser l'image docker takeyamajp/ubuntu-sshd

Sources :
- module [Docker-compose](https://docs.ansible.com/ansible/latest/collections/community/docker/docker_compose_module.html)
- [boucles](https://docs.ansible.com/ansible/latest/playbook_guide/playbooks_loops.html)

<br>

<details>

<summary>Solution</summary>

## Gestion inventaire
Créer le dossier playbook avec son fichier
```plain
mkdir -p playbook
```{{exec}}
```plain
touch playbook/main.yml
```{{exec}}

Utiliser l'éditeur pour générer le fichier playbook/main.yml
```plain
---

# Ce playbook crée un lab pour ansible ad-hoc via ansible
- name: Mise en place reseau local et des images docker
  hosts: localhost
  tasks:
  - name: création network
    community.docker.docker_compose:
      project_name: fablab
      definition:
        version: '3'
        networks:
          sshnet:
            driver: bridge
            ipam:
              config:
                - subnet: {{ ip_net }}
  - name: creation machines
    community.docker.docker_compose:
      project_name: fablab
      definition:
        version: '3'
        services:
          "{{ item }}"
            environment:
              - ROOT_PASSWORD="{{ root_password }}"
            image: "{{ docker_image }}"
          networks:
            sshnet:
              ipv4_address: "{{ item.ansible_host }}"
          restart: always
    with_items: "{{ groups['nodes'] }}"

```
