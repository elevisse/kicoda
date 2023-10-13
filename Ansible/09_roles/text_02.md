# Créer un rôle local pour la gestion docker-compose

Actions à réaliser :
- créer le role ssh_hosts avec son arborescence
- créer un fichier de tâches pour les inventaires et machines
- Créer un fichier de tâches pour la partie ssh

<br>

<details>

<summary>Solution</summary>

## Actions 

Créer le dossier roles ssh_hosts avec son arborescence minimale :
```plain
mkdir -p playbook/roles/ssh_hosts
```{{exec}}
```plain
mkdir -p playbook/roles/ssh_hosts/tasks
```{{exec}}

Créer le fichier de taches pour la gestion des hôtes :
```plain
touch playbook/roles/ssh_hosts/tasks/hosts.yml
```{{exec}}

Editer pour y mettre les actions nécessaire
```plain
---

# Ce fichier gère les actions à réaliser sur la machine locale
- name: remplissage fichier hosts
  ansible.builtin.lineinfile:
    path: /etc/hosts
    search_string: "{{ ansible_host }}"
    line: "{{ ansible_host }} {{ inventory_hostname }}"
    owner: root
    group: root
    mode: '0644'
  delegate_to: localhost
  connection: local

- name: creation dossier inventaire basique
  ansible.builtin.file:
    path: /etc/ansible
    state: directory
    mode: '0755'
  delegate_to: localhost
  connection: local
  when: inventory_hostname == groups['nodes'][0]

- name: remplissage inventaire basique
  ansible.builtin.lineinfile:
    path: /etc/ansible/hosts
    search_string: "{{ inventory_hostname }}"
    line: "{{ inventory_hostname }}"
    create: true
    owner: root
    group: root
    mode: '0644'
  delegate_to: localhost
  connection: local

```

Créer le fichier de taches pour la gestion ssh :
```plain
touch playbook/roles/ssh_hosts/tasks/ssh.yml
```{{exec}}

Editer pour y mettre les actions nécessaire
```plain
---

# Ce fichier gère les actions à réaliser pour les cles ssh
- name: obtention cles ssh ips
  ansible.builtin.known_hosts:
    name: "{{ ansible_host }}"
    key: "{{ lookup('ansible.builtin.pipe', 'ssh-keyscan ' + ansible_host) }}"
  delegate_to: localhost
  connection: local

- name: obtention cles ssh noms d'hotes
  ansible.builtin.known_hosts:
    name: "{{ inventory_hostname }}"
    key: "{{ lookup('ansible.builtin.pipe', 'ssh-keyscan ' + inventory_hostname) }}"
  delegate_to: localhost
  connection: local

- name: depose de la cle publique
  ansible.posix.authorized_key:
    user: root
    state: present
    key: "{{ lookup('file', '~/.ssh/id_rsa.pub') }}"
  vars:
    ansible_password: "{{ root_password }}"

```

Créer le fichier de taches main :
```plain
touch playbook/roles/ssh_hosts/tasks/main.yml
```{{exec}}

Editer pour y mettre les actions nécessaire
```plain
---

# Ce fichier gère les appels des autres tâches
- name: appel gestion hosts
  ansible.builtin.include_tasks:
    file: hosts.yml

- name: appel gestion ssh
  ansible.builtin.include_tasks:
    file: ssh.yml

```

</details>
