Utiliser les playbooks ansible

Actions à réaliser :
- créer un playbook d'installation tomcat qui s'applique uniquement aux machines "middle"
- se baser sur ce tuto : [https://jeevisoft.com/blogs/2025/01/how-to-install-apache-tomcat11version-11-0-2-on-ubuntu/](https://jeevisoft.com/blogs/2025/01/how-to-install-apache-tomcat11version-11-0-2-on-ubuntu/) uniquement du step 3 jusqu'au step 7
- Attention au lien de l'archive : les versions évoluent
- pour que tomcat se lance au démarrage, créer le lien symbolique /root/start-tomcat.sh pointant vers /opt/tomcat/bin/startup.sh via le module [https://docs.ansible.com/ansible/latest/collections/ansible/builtin/file_module.html](ansible file)
- pour démarrer tomcat, forcer le reboot de la machine cette commande en local "docker-compose -f /root/docker-compose restart node03"
- utiliser le module [https://docs.ansible.com/ansible/latest/collections/ansible/builtin/unarchive_module.html](ansible unarchive) télécharger et désarchiver directement le tar.gz tomcat depuis sa source internet

<br>

<details>

<summary>Solution</summary>

Activer le virtual env :
```plain
cd ~/ansible
source bin/activate
```{{exec}}

Créer le playbook middle.yml
```plain
touch playbook/middle.yml
```{{exec}}

Utiliser l'éditeur pour créer le playbook qui permet de gérer le middle
```plain
---

# Ce playbook cree le user et le middle tomcat
- name: tomcat
  hosts: middle
  tasks:
  - name: installer jdk
    ansible.builtin.package:
      name:
      - openjdk-17-jdk
      - sudo
      state: latest
  - name: ajouter groupe tomcat
    ansible.builtin.group:
      name: tomcat
      state: present
  - name: ajouter user tomcat
    ansible.builtin.user:
      name: tomcat
      home: /opt/tomcat
      shell: /bin/false
      groups: tomcat
  - name: decompression sources tomcat
    ansible.builtin.unarchive:
      src: "https://downloads.apache.org/tomcat/tomcat-11/v11.0.9/bin/apache-tomcat-11.0.9.tar.gz"
      dest: "/opt/tomcat/"
      remote_src: true
      extra_opts: [--strip-components=1]
  - name: trouver les fichiers sh
    ansible.builtin.find:
      paths: /opt/tomcat/bin
      patterns: '*.sh'
    register: sh_files
  - name: Passer les sh executables
    ansible.builtin.file:
      path: "{{ item.path }}"
      mode: "0755"
    with_items: "{{ sh_files.files }}"
    notify: start tomcat with reboot
  - name: Creation lien symbolique
    ansible.builtin.file:
      src: /opt/tomcat/bin/startup.sh
      dest: /root/start-tomcat.sh
      owner: root
      group: root
      state: link
    notify: start tomcat with reboot
  handlers:
    - name: start tomcat with reboot
      ansible.builtin.command:
        cmd: "docker-compose -f /root/docker-compose.yml restart node03"
      delegate_to: localhost

```

Cette commande jouera le playbook
```plain
ansible-playbook playbook/middle.yml
```{{exec}}

Rejouer le playbook pour constater l'idempotence
```plain
ansible-playbook playbook/middle.yml
```{{exec}}

</details>
