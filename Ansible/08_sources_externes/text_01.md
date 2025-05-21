# Récupérer les sources manuellement

Actions à réaliser :
- cloner le projet [elevisse/kicoda](https://github.com/elevisse/kicoda)
- aller dans le repertoire du projet github Ansible/project
- jouer le playbook présent avec l'inventaire inventory
- utiliser le mot de passe vault sensible
- tester la commande ad-hoc

<br>

<details>

<summary>Solution</summary>

## Actions

Activer le virtual env :
```plain
cd ~/ansible
source bin/activate
```{{exec}}

Cloner le rojet
```
git clone https://github.com/elevisse/kicoda
```{{exec}}

Aller dans le dossier kicoda/Ansible/project
```
cd kicoda/Ansible/project
```{{exec}}

Jouer le playbook avec le mot de passe sensible
```
ansible-playbook playbook/main.yml -i inventory --ask-vault-pass
```{{exec}}

tester les commandes ad-hoc :
```plain
ansible all -m ansible.builtin.ping
```{{exec}}

Quitter le virtual env :
```plain
deactivate
cd ~
```{{exec}}
