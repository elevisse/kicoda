# chiffrer les informations sensibles

Actions à réaliser sur l'inventaire :
- créer un fichier vault.yml pour chaque élément sensible
- regrouper au maximum pour n'avoir qu'une seule varaible

Sources :
- [commande ansible-vault](https://docs.ansible.com/ansible/latest/cli/ansible-vault.html)
- [vault dans les playbooks](https://docs.ansible.com/ansible/latest/vault_guide/vault_managing_passwords.html)
- [chiffrement de fichiers complets](https://docs.ansible.com/ansible/latest/vault_guide/vault_using_encrypted_content.html)
<br>

<details>

<summary>Solution</summary>

## Regroupement 
supprimer la ligne suivante dans le fichier inventory/group_vars/nodes/all.yml et du fichier inventory/host_vars/localhost.yml
```
root_password: ubuntu
```
Créer le dossier global pour tous les hôtes
```plain
mkdir -p inventory/group_vars/all
```{{exec}}

Créer le fichier inventory/group_vars/all.yml
```plain
touch inventory/group_vars/all/all.yml
```{{exec}}

Editer le fichier inventory/group_vars/all/all.yml
```plain
root_password: "{{ vault_root_password }}"
```

Créer le fichier inventory/group_vars/all/vault.yml
```plain
touch inventory/group_vars/vault.yml
```{{exec}}

Editer le fichier inventory/group_vars/all/vault.yml
```plain
vault_root_password: "ubuntu"
```
