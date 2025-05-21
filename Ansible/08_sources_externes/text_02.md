# On fait la même chose par scripting

Action hors script :
- créer le fichier mot de passe vault ~/.vault_pass_file avec le mot de passe sensible

Actions à réaliser dans le script :
- Supprimer le dossier du virtualenv s'il existe
- créer le dossier virtualenv
- installer ansible
- installer les collections ansible.posix et ommunity.docker
- cloner le projet [elevisse/kicoda](https://github.com/elevisse/kicoda)
- aller dans le repertoire Ansible/project
- jouer le playbook présent dans project/Ansible/playbook avec l'inventaire de project/inventory avec le fichier de mot de passe vault

<br>

<details>

<summary>Solution</summary>

## Actions

Créer le fichier de mot de passe vault
```plain
cd
```{{exec}}
```plain
echo "sensible" >> ~/.vault_pass_file
```{{exec}}

## Scripting

Créer le fichier de script call_playbook.sh et le rendre éxécutable :
```plain
touch call_playbook.sh
```{{exec}}
```plain
chmod +x call_playbook.sh
```{{exec}}

Utiliser l'éditeur pour construire le script:
```plain
#!/bin/bash

if [ -d "ansible" ]; then
    rm -Rf ansible
fi

python3.12 -m venv ansible
cd ansible
source bin/activate
pip install ansible
ansible-galaxy collection install ansible.posix
ansible-galaxy collection install community.docker

git clone https://github.com/elevisse/kicoda
cd kicoda/Ansible/project
ansible-playbook playbook/main.yml -i inventory --vault-pass-file ~/.vault_pass_file
deactivate
cd

```

Jouer le playbook :
```plain
./call_playbook.sh
```{{exec}}

</details>
