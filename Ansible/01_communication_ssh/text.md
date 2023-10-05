Utiliser l'utilitaire python pip pour installer ansible et on vérifie sa présence.

Actions à réaliser :
- créer une clé ssh
- copier la clés sur les hôtes distants

<br>

<details>

<summary>Solution</summary>

Utiliser les commandes suivantes afin de créer les clés ssh privées et publiques du serveur puis les copier à distance

```plain
ssh-keygen
```{{exec}}

```plain
ssh-copy-id ubuntu@host1
ssh-copy-id ubuntu@host2
ssh-copy-id ubuntu@host3
```{{exec}}

</details>