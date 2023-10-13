# Créer un rôle local pour la gestion docker-compose

Actions à réaliser :
- modification du playbook pour appeler les rôles

<br>

<details>

<summary>Solution</summary>

## Actions 

Modifier le playbook/main.yml pour appeler les rôles :
```plain
---

# Ce playbook crée un lab pour ansible ad-hoc via ansible
- name: Mise en place reseau local et des images docker
  hosts: local
  roles:
  - role: docker_compose

# Cette partie gère l'obtention des clés
- name: Mise en place reseau local et des images docker
  hosts: nodes
  gather_facts: no
  roles:
  - role: ssh

```

</details>
