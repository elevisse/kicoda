# chiffrer et appeler les informations sensibles

Actions à réaliser sur l'inventaire :
- chiffrer via ansible-vault le fichier sensible avec le mot de passe sensible
- appeler le playbook avec --ask-vault-pass
- créer un fichier caché et appeler le playbook avec --vault-pass-file

Sources :
- [commande ansible-vault](https://docs.ansible.com/ansible/latest/cli/ansible-vault.html)
- [vault dans les playbooks](https://docs.ansible.com/ansible/latest/vault_guide/vault_managing_passwords.html)
- [chiffrement de fichiers complets](https://docs.ansible.com/ansible/latest/vault_guide/vault_using_encrypted_content.html)
<br>

<details>

<summary>Solution</summary>

## Chiffrement 
Chiffrer le fichier inventory/group_vars/all/vault.yml et utiliser le mot de passe sensible
```plain
ansible-vault encrypt inventory/group_vars/all/vault.yml --ask-vault-pass
```{{exec}}

## Appels et tests
Appeler le playbook avec le mot de passe vault
```plain
ansible-playbook playbook/main.yml -i inventory --ask-vault-pass
```{{exec}}

Créer le fichier de mot de passe vault
```plain
echo "sensible" >> .vault_pass_file
```{{exec}}

Appeler le playbook avec le fichier
```plain
ansible-playbook playbook/main.yml -i inventory --vault-pass-file .vault_pass_file
```{{exec}}

</details>