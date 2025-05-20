Utiliser les éditeurs pour construire l'inventaire

Actions à réaliser :
- créer le fichier d'inventaire yaml d'inventaire spécifique ~/inventory/hosts/inventory.yml
- indiquer 3 groupes d'hôtes : frontal, middle et back pour node01, node02 et node03
- ansible ping pour toutes les machines sur ce nouvel inventaire
- ansible ping de chaque groupe d'hôte

<br>

<details>

<summary>Solution</summary>

Cette solution indique les étapes principales et la succession de commandes.

Créer d'abord le dossier d'inventaire :
```plain
mkdir -p ~/inventory/hosts
```{{exec}}

Création du fichier :
```plain
touch ~/inventory/hosts/inventory.yml
```{{exec}}

Aller dans ce fichier depuis l'éditeur afin de créer ce fichier
```plain
frontal:
  hosts:
    node01
middle:
  hosts:
    node02
back:
  hosts:
    node03

```

Ping de tous les hôtes :
```plain
ansible all -m ansible.builtin.ping -i inventory
```{{exec}}

Ping uniquement des machines frontales :
```plain
ansible frontal -m ansible.builtin.ping -i inventory
```{{exec}}

Ping uniquement des machines middle :
```plain
ansible middle -m ansible.builtin.ping -i inventory
```{{exec}}

Ping uniquement des machines back :
```plain
ansible back -m ansible.builtin.ping -i inventory
```{{exec}}

Désactiver le virtual env :
```plain
deactivate
```{{exec}}

</details>

