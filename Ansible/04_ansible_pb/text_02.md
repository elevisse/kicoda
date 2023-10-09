Utiliser les playbooks ansible

Actions à réaliser :
- créer un playbook d'installation apache et nodeJS qui s'applique uniquement aux machines "frontal"
- gérer le cas d'une machine type RedHat ou Debian à l'aide de facts

<br>

<details>

<summary>Solution</summary>

Créer le playbook front.yml
```plain
touch playbook/front.yml
```{{exec}}

Créer le dossier var
```plain
mkdir -p playbook/vars
```{{exec}}

Créer les fichiers Debian.yml, default.yml et RedHat.yml
```plain
touch playbook/vars/Debian.yml playbook/vars/default.yml playbook/vars/RedHat.yml
```{{exec}}

Utiliser l'éditeur pour gérer la variable frontale de Debian.yml et default.yml
```plain
apache_pck: apache2

```

Utiliser l'éditeur pour gérer la variable frontale de RedHat.yml
```plain
apache_pck: httpd

```

Utiliser l'éditeur pour créer le playbook qui permet de gérer le frontal
```plain
---

# Ce playbook installe apache et nodeJS
- name: Apache et nodeJS
  hosts: frontal
  tasks:
  - name: variables OS
    ansible.builtin.include_vars: "{{ lookup('ansible.builtin.first_found', params) }}"
    vars:
      params:
        files:
          - '{{ansible_os_family}}.yml'
          - default.yml
        paths:
          - 'vars'
  - name: apache
    ansible.builtin.package:
      name: "{{ apache_pck }}"
      state: latest
  - name: EPEL on CentOS
    ansible.builtin.yum:
      name: epel-release
      state: present
    when: ansible_facts['os_family'] == "RedHat"
  - name: nodeJS
    ansible.builtin.package:
      name: "nodejs"
      state: latest

```

Cette commande jouera le playbook
```plain
ansible-playbook playbook/front.yml
```{{exec}}

Rejouer le playbook pour constater l'idempotence
```
ansible-playbook playbook/front.yml
```

</details>
