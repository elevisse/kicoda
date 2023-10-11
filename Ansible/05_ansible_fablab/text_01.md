# construire l'inventaire local et des nouveaux noeuds

Actions à réaliser :
- créer le dossier d'inventaire
- créer le dossier hosts
- créer la liste des hôtes
- gérer les IPs des noeuds
- créer des varibles d'hotes pour localhost afin de passer la connexion en mode local [cf connection_details](https://docs.ansible.com/ansible/latest/inventory_guide/connection_details.html)
- créer des variables groupes pour forcer les paramètres ROOT_PASSWORD et ansible_user à root

<br>

<details>

<summary>Solution</summary>

## Gestion inventaire
Créer le dossier d'inventaire
```plain
mkdir -p inventory
```{{exec}}

Créer le dossier pour les hôtes
```plain
mkdir -p inventory/hosts
```{{exec}}

Créer le fichier d'inventaire
```plain
touch inventory/hosts/inventory.yml
```{{exec}}

Utiliser l'éditeur pour générer le fichier d'inventaire inventory/hosts/inventory.yml
```plain
all:
  children:
    local:
      hosts:
        localhost:
    nodes:
      hosts:
        node01:
        node02:
        node03:

```

## Gestion des hôtes
Créer le fichier de variables hôtes pour gérer la machine locale
```plain
mkdir -p inventory/host_vars
```{{exec}}
```plain
touch inventory/host_vars/localhost.yml
```{{exec}}

Utiliser l'éditeur pour générer le fichier de variables hôtes pour gérer la machine locale inventory/hosts/inventory.yml
```plain
ansible_connection: local

```

Créer les fichiers hôtes pour gérer chaque noeud (remplacer <n> par chaque numéro de noeud)
```plain
touch inventory/host_vars/node0<n>.yml
```{{exec}}

Utiliser l'éditeur pour générer le fichier de variables hôtes pour gérer la machine locale inventory/hosts/inventory.yml
```plain
ansible_host: 10.1.0.<n>

```

## Gestion group vars
Créer le fichier de variables groupe pour gérer la connexion aux noeuds
```plain
mkdir -p inventory/group_vars/nodes
```{{exec}}
```plain
touch inventory/group_vars/nodes/all.yml
```{{exec}}

Utiliser l'éditeur pour gérer la connexion aux noeuds via inventory/group_vars/nodes/all.yml
```plain
ansible_user: root
root_password: ubuntu
ip_net: "10.1.0.0/16"
docker_image: "takeyamajp/ubuntu-sshd"

```
