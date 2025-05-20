Utiliser l'utilitaire ansible pour les commandes ad-hoc

Actions à réaliser :
- lister l'inventaire existant
- ansible ping pour toutes les machines
- commande ad-hoc de shell pour afficher l'heure

<br>

<details>

<summary>Solution</summary>

Activer virtual env
```plain
cd ansible
source bin/activate
```{{exec}}

Cette commande sert à lister l'inventaire
```plain
ansible all --list-hosts
```{{exec}}

Ces commandes permettent de tesr la connexion sur les différents noeuds
```plain
ansible all -m ping
```{{exec}}
```plain
ansible all -m ansible.builtin.ping
```{{exec}}

Cette commande affichera l'heure
```plain
ansible all -m shell -a "date"
```{{exec}}
```plain
ansible all -m ansible.builtin.shell -a "date"
```{{exec}}
</details>

Bonus : tester les résultats de ces commandes :
```plain
ansible all[0:1] -m ping
```{{exec}}
```plain
ansible all[1:] -m ansible.builtin.ping
```{{exec}}

Désactiver virtual env
```plain
deactivate
```{{exec}}
