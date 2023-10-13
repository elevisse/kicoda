# Créer un rôle local pour la gestion docker_compose

Actions à réaliser :
- créer dossier roles dans le playbook
- créer le role docker_compose avec l'arborescence minimum
- Déplacer le template
- Créer les tâches dans le main

<br>

<details>

<summary>Solution</summary>

## Actions 

Créer le dossier roles local
```plain
mkdir -p playbook/roles
```{{exec}}

Créer le dossier roles docker_compose avec son arborescence minimale :
```plain
mkdir -p playbook/roles/docker_compose
```{{exec}}
```plain
mkdir -p playbook/roles/docker_compose/tasks
```{{exec}}
```plain
mkdir -p playbook/roles/docker_compose/templates
```{{exec}}

Déplacer le template dans le bon dossier et supprimer le dossier inutile du playbook :
```plain
mv playbook/templates/docker-compose.yml.j2 playbook/roles/docker_compose/templates/
```{{exec}}
```plain
rm -Rf playbook/templates
```{{exec}}

Créer le fichier de taches pour la gestion du docker_compose :
```plain
touch playbook/roles/docker_compose/tasks/main.yml
```{{exec}}

Editer pour y mettre les actions nécessaire
```plain
---

# Ce fichier gère les actions à réaliser sur la machine locale
- name: template lab
  ansible.builtin.template:
    src: docker-compose.yml.j2
    dest: /root/docker-compose.yml
    owner: root
    group: root
    mode: '0644'

- name: creation lab
  community.docker.docker-compose:
    project_src: flask
    files:
    - /root/docker-compose.yml

```{{exec}}

</details>
