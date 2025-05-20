Utiliser les éditeurs pour construire l'inventaire

Actions à réaliser :
- créer le fichier d'inventaire par défaut
- indiquer 3 groupes d'hôtes : frontal, middle et back pour node01, node02 et node03
- ansible ping pour toutes les machines
- ansible ping de chaque groupe d'hôte

<br>

<details>

<summary>Solution</summary>

Cette solution indique les étapes principales et la succession de commandes.

Créer d'abord le dossier d'inventaire :
```plain
mkdir -p /etc/ansible
```{{exec}}

Création du fichier :
```plain
touch /etc/ansible/hosts
```{{exec}}

Aller dans ce fichier depuis l'éditeur afin de créer ce fichier
```plain
[frontal]
node01

[middle]
node02

[back]
node03

```

Activer le virtual env :
```plain
cd ansible
source bin/activate
```{{exec}}

Ping de tous les hôtes :
```plain
ansible all -m ansible.builtin.ping
```{{exec}}

Ping uniquement des machines frontales :
```plain
ansible frontal -m ansible.builtin.ping
```{{exec}}

Ping uniquement des machines middle :
```plain
ansible middle -m ansible.builtin.ping
```{{exec}}

Ping uniquement des machines back :
```plain
ansible back -m ansible.builtin.ping
```{{exec}}

</details>

