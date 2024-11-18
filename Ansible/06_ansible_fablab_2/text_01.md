# construire le template et modifier le playbook

Actions à réaliser :
- créer le dossier template pour le playbook
- créer le template pour modifier la tâche creation lab
- modifier le playbook et tester

Sources :
- [module docker_compose](https://docs.ansible.com/ansible/latest/collections/community/docker/docker_compose_v2_module.html#ansible-collections-community-docker-docker-compose-v2-module)
- [playbooks_templating](https://docs.ansible.com/ansible/latest/playbook_guide/playbooks_templating.html)
- [module template](https://docs.ansible.com/ansible/latest/collections/ansible/builtin/template_module.html)
- [Docs sur jinja2](https://jinja.palletsprojects.com/en/3.1.x/)
<br>

<details>

<summary>Solution</summary>

## Gestion template
Créer le dossier template pour le playbook
```plain
mkdir -p playbook/templates
```{{exec}}

Créer le fichier template
```plain
touch playbook/templates/docker-compose.yml.j2
```{{exec}}

Editer le template playbook/templates/docker-compose.yml.j2 afin d'optimiser les services via des boucles :
```plain
version: "3"

networks:
  sshnet:
    driver: bridge
    ipam:
      config:
        - subnet: "{{ ip_net }}"
services:
{% for host in groups['nodes'] %}
  {{ host }}:
    environment:
      ROOT_PASSWORD: "{{ root_password }}"
    image: "{{ docker_image }}"
    networks:
      sshnet:
        ipv4_address: {{ hostvars[host]['ansible_host'] }}
    restart: always
{% endfor %}

```

Modifier le fichier playbook/main.yml pour utiliser le template modifier l'utilisation du module community.docker.docker_compose :
```plain
...
- name: Mise en place reseau local et des images docker
  hosts: local
  tasks:
  - name: template lab
    ansible.builtin.template:
      src: templates/docker-compose.yml.j2
      dest: /root/docker-compose.yml
      owner: root
      group: root
      mode: '0644'
  - name: creation folder lab
    ansible.builtin.file:
      path: /root/playbook/fablab
      state: directory
      owner: root
      group: root
      mode: '0644'
  - name: creation lab
    community.docker.docker_compose_v2:
      project_src: fablab
      files:
      - /root/docker-compose.yml
...
```

Utiliser le playbook :
```plain
ansible-playbook playbook/main.yml -i inventory
```{{exec}}

Valider l'idempotence playbook :
```plain
ansible-playbook playbook/main.yml -i inventory
```{{exec}}

</details>

## excercice bonus sans correction :
- créer le template pour gérer le fichier /etc/hosts rétrocompatible lab
- faire de même pour l'inventaire basique ansible /etc/ansible/hosts
