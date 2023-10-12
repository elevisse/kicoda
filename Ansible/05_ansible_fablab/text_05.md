Création playbook : empreintes ssh

Actions à réaliser grâce au groupe nodes :
- appliquer le playbook
- tester les commandes ad-hoc

<br>

<details>

<summary>Solution</summary>

Application playbook

Utiliser le playbook :
```plain
ansible-playbook playbook/main.yml -i inventory
```{{exec}}

Valider l'idempotence playbook :
```plain
ansible-playbook playbook/main.yml -i inventory
```{{exec}}

tester les commandes ad-hoc :
```plain
ansible all -m ansible.builtin.ping
```{{exec}}

</details>
