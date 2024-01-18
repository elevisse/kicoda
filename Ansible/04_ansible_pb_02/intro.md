Utiliser les playbooks ansible

Actions qui seront réalisées dans ce lab :
- créer un dossier playbook et mettre chaque playbook dedans. Conserver main.yml pour le tout dernier excercice
- créer un playbook qui met à jour les packages système et cree un user app
- créer un playbook d'installation apache et nodeJS qui s'applique uniquement aux machines "frontal"
- créer un playbook d'installation tomcat qui s'applique uniquement aux machines "middle"
- créer un playbook d'installation mysql qui s'applique uniquement aux machines "back"
- fusionner toutes les actions dans un seul playbook


Sources utiles pour ce lab :
- Création groupe unix : [https://docs.ansible.com/ansible/latest/collections/ansible/builtin/group_module.html](https://docs.ansible.com/ansible/latest/collections/ansible/builtin/group_module.html)
- Création d'utilisateur unix : [https://docs.ansible.com/ansible/latest/collections/ansible/builtin/user_module.html](https://docs.ansible.com/ansible/latest/collections/ansible/builtin/user_module.html)
- Gestion de packages systèmes : [https://docs.ansible.com/ansible/latest/collections/ansible/builtin/package_module.html](https://docs.ansible.com/ansible/latest/collections/ansible/builtin/package_module.html)
- Conditions dans les playbooks : [https://docs.ansible.com/ansible/latest/playbook_guide/playbooks_conditionals.html](https://docs.ansible.com/ansible/latest/playbook_guide/playbooks_conditionals.html)
- Trouver des fichiers : [https://docs.ansible.com/ansible/latest/collections/ansible/builtin/find_module.html](https://docs.ansible.com/ansible/latest/collections/ansible/builtin/find_module.html)
- Gestion de fichiers : [https://docs.ansible.com/ansible/latest/collections/ansible/builtin/file_module.html](https://docs.ansible.com/ansible/latest/collections/ansible/builtin/file_module.html)
- gestion des variables : [https://docs.ansible.com/ansible/latest/collections/ansible/builtin/include_vars_module.html](https://docs.ansible.com/ansible/latest/collections/ansible/builtin/include_vars_module.html)
- boucles sur des résultats : [https://docs.ansible.com/ansible/latest/playbook_guide/playbooks_loops.html](https://docs.ansible.com/ansible/latest/playbook_guide/playbooks_loops.html)
- opérations conditionnelles : [https://docs.ansible.com/ansible/latest/playbook_guide/playbooks_handlers.html](https://docs.ansible.com/ansible/latest/playbook_guide/playbooks_handlers.html)
