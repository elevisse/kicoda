# Créer un rôle local pour la gestion docker_compose

Actions à réaliser :
- installer ansible-lint
- valider le code existant
- corriger les erreurs que le formateur a laissé volontairement
- lancer le playbook

<br>

<details>

<summary>Solution</summary>

## Actions

Activer le virtual env :
```plain
cd ~/ansible
source bin/activate
```{{exec}}

Installer ansible-lint:
```plain
pip install ansible-lint
```{{exec}}

Valider le playbook:
```plain
ansible-lint playbook
```{{exec}}

Ici, la solution n'indique pas comment corriger les erreurs

Tester le playbook :
```plain
ansible-playbook playbook/main.yml -i inventory --ask-vault-pass
```{{exec}}

</details>
