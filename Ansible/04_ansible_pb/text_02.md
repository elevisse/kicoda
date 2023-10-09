Utiliser les playbooks ansible

Actions à réaliser :
- créer un playbook d'installation apache et nodeJS qui s'applique uniquement aux machines "frontal"
- gérer le cas d'une machine type RedHat ou Debian

<br>

<details>

<summary>Solution</summary>

Créer le playbook front.yml
```plain
touch playbook/front.yml
```{{exec}}

Utiliser l'éditeur pour créer le playbook qui permet de gérer le système
```plain
---

# Ce playbook mets a jour les paquets systemes et cree un utilisateur applicatif app
- name: Apache et nodeJS
  hosts: frontal
  tasks:
  - name: Apache on debian-like
    ansible.builtin.package:
      name: "apache"
      state: latest
    when: ansible_facts['os_family'] == "Debian"
  - name: Apache on RedHat-like
    ansible.builtin.package:
      name: "httpd"
      state: latest
    when: ansible_facts['os_family'] == "RedHat"
  - name: nodeJS
    ansible.builtin.package:
      name: "nodejs"
      state: latest

```

Cette commande jouera le playbook
```plain
ansible-playbook playbook/sys.yml
```{{exec}}

Rejouer le playbook pour constater l'idempotence
```
ansible-galaxy collection install community.general
```

</details>
