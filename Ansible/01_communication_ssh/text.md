Utiliser l'utilitaire python pip pour installer ansible et on vérifie sa présence.

Actions à réaliser :
- créer une clé ssh
- copier la clés sur les hôtes distants
- tester la connexion

<br>

<details>

<summary>Solution</summary>

Utiliser les commandes suivantes afin de créer les clés ssh privées et publiques du serveur puis les copier à distance

```plain
ssh-keygen
```{{exec}}

```plain
ssh-copy-id ubuntu@node01
```{{exec}}

```plain
ssh ubuntu@node01
```{{exec}}

</details>
