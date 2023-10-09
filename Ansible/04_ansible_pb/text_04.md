Utiliser les playbooks ansible

Actions à réaliser :
- créer un playbook d'installation mysql qui s'applique uniquement aux machines "back"

<br>

<details>

<summary>Solution</summary>

Créer le playbook back.yml
```plain
touch playbook/back.yml
```{{exec}}

Utiliser l'éditeur pour créer le playbook qui permet de gérer le frontal
```plain
---

# Ce playbook mets a jour les paquets mysql
- name: installation mysql
  hosts: back
  tasks:
  - name: mysql
    ansible.builtin.package:
      name: "mysql-server"
      state: latest

```

Cette commande jouera le playbook
```plain
ansible-playbook playbook/back.yml
```{{exec}}

Rejouer le playbook pour constater l'idempotence
```
ansible-playbook playbook/back.yml
```

</details>
