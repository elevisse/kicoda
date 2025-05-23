Utiliser les playbooks ansible

Actions à réaliser :
- créer un dossier playbook et mettre chaque playbook dedans. Conserver main.yml pour le tout dernier excercice
- créer un playbook qui met à jour les packages systèmes et cree un user app

<br>

<details>

<summary>Solution</summary>

Activer le virtual env :
```plain
cd ansible
source bin/activate
```{{exec}}

Créer le dossier playbook et créer le playbook sys.yml
```plain
mkdir -p playbook
```{{exec}}
```plain
touch playbook/sys.yml
```{{exec}}

Utiliser l'éditeur pour créer le playbook qui permet de gérer le système
```plain
---

# Ce playbook met a jour les paquets systemes et cree un utilisateur applicatif app
- name: MAJ et user app
  hosts: all
  tasks:
  - name: MAJ
    ansible.builtin.package:
      name: "*"
      state: latest
  - name: ajouter groupe app
    ansible.builtin.group:
      name: app
      state: present
  - name: user app
    ansible.builtin.user:
      name: app
      groups: app
      shell: /bin/bash
      append: yes

```

Cette commande jouera le playbook
```plain
ansible-playbook playbook/sys.yml
```{{exec}}

Rejouer le playbook pour constater l'idempotence
```plain
ansible-playbook playbook/sys.yml
```{{exec}}

</details>
