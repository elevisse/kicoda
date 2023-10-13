# Récupérer les sources manuellement

Actions à réaliser :
- cloner le projet [elevisse/kicoda](https://github.com/elevisse/kicoda)
- aller dans le repertoire project
- jouer le playbook présent dans project/Ansible/playbook avec l'inventaire de project/inventory
- utiliser le mot de passe vault sensible
- tester la commande ad-hoc

<br>

<details>

<summary>Solution</summary>

## Actions 
Cloner le rojet
```
git clone https://github.com/elevisse/kicoda
```{{exec}}

Aller dans le dossier kicoda/Ansible/project
```
cd kicoda/project
```{{exec}}

Jouer le playbook avec le mot de passe sensible
```
ansible-playbook playbook/main.yml -i inventory --ask-vault-pass
```{{exec}}

tester les commandes ad-hoc :
```plain
ansible all -m ansible.builtin.ping
```{{exec}}
