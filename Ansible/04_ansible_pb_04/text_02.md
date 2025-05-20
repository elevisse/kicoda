Utiliser les playbooks ansible

Actions à réaliser :
- fusioner les playbooks
- utiliser [import_playbook_module](https://docs.ansible.com/ansible/latest/collections/ansible/builtin/import_playbook_module.html)

<br>

<details>

<summary>Solution</summary>

Créer le playbook main.yml
```plain
touch playbook/main.yml
```{{exec}}

Utiliser l'éditeur pour créer le playbook qui permet d'appeler tous les autres
```plain
---

# Ce playbook joue toute l'application
- name: system
  ansible.builtin.import_playbook: sys.yml
- name: back
  ansible.builtin.import_playbook: back.yml
- name: middle
  ansible.builtin.import_playbook: middle.yml
- name: front
  ansible.builtin.import_playbook: front.yml

```

Cette commande jouera le playbook
```plain
ansible-playbook playbook/main.yml
```{{exec}}

Rejouer le playbook pour constater l'idempotence
```plain
ansible-playbook playbook/main.yml
```{{exec}}

</details>
