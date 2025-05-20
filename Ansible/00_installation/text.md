Utiliser l'utilitaire python pip pour installer ansible et on vérifie sa présence.

Actions à réaliser :
- installer le package python3.12-venv
- créer le virtualenv ansible
- naviguer dans le dossier et activer le virtualenv
- vérifier la version d'Ansible
- quitter le virtualenv

<br>

<details>

<summary>Solution</summary>

Utiliser les commandes suivantes afin d'installer et vérifier la présence d'Ansible

```plain
sudo apt install python3.12-venv
```{{exec}}

```plain
python3.12 -m venv ansible
cd ansible
source bin/activate
```{{exec}}

```plain
pip install ansible
```{{exec}}

```plain
ansible --version
```{{exec}}

</details>
