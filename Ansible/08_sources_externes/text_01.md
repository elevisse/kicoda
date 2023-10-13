# Récupérer les sources manuellement

Actions à réaliser :
- cloner le projet [elevisse/kicoda](https://github.com/elevisse/kicoda)
- aller dans le repertoire project
- jouer le playbook présent dans project/playbook avec l'inventaire de project/inventory
- utiliser le mot de passe vault sensible

<br>

<details>

<summary>Solution</summary>

## Regroupement 
Cloner le rojet
```
git clone https://github.com/elevisse/kicoda
```{{exec}}

Aller dans le dossier project
```
cd project
```{{exec}}

Jouer le playbook avec le mot de passe sensible
```
ansible-playbook playbook/main.yml -i inventory --ask-vault-pass
```{{exec}}
