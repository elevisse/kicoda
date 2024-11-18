Utiliser les playbooks ansible

Actions à réaliser :
- créer un playbook d'installation tomcat qui s'applique uniquement aux machines "middle"
- se baser sur ce tuto : [https://www.linuxtechi.com/how-to-install-apache-tomcat-on-debian/](https://www.linuxtechi.com/how-to-install-apache-tomcat-on-debian/) jusqu'au point 6, plus si souhaité
- Attention au lien de l'archive : les versions évoluent
- ignorer l'erreur du start tomcat car env containerisé

<br>

<details>

<summary>Solution</summary>

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
      - openjdk-11-jdk
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
      src: "https://downloads.apache.org/tomcat/tomcat-10/v10.1.33/bin/apache-tomcat-10.1.18.tar.gz"
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
  - name: inserer le fichier demon
    ansible.builtin.copy:
      src: "files/tomcat.service"
      dest: "/etc/systemd/system/tomcat.service"
      mode: "0755"
    notify: "start tomcat"
  handlers:
    - name: start tomcat
      ansible.builtin.systemd:
        name: tomcat
        daemon_reload: true
        enabled: true
        state: restarted
        force: true
      become: yes
      ignore_errors: yes

```

Créer un dossier de fichiers pour le playbook
```plain
mkdir -p playbook/files
```{{exec}}

Créer le fichier démon
```plain
touch playbook/files/tomcat.service
```{{exec}}

Utiliser l'éditeur pour y insérer ce contenu
```plain
[Unit]
Description=Tomcat webs servlet container
After=network.target
[Service]
Type=forking
User=tomcat
Group=tomcat
RestartSec=10
Restart=always
Environment="JAVA_HOME=/usr/lib/jvm/java-1.11.0-openjdk-amd64"
Environment="JAVA_OPTS=-Djava.awt.headless=true -Djava.security.egd=file:/dev/./urandom"
Environment="CATALINA_BASE=/opt/tomcat"
Environment="CATALINA_HOME=/opt/tomcat"
Environment="CATALINA_PID=/opt/tomcat/temp/tomcat.pid"
Environment="CATALINA_OPTS=-Xms512M -Xmx1024M -server -XX:+UseParallelGC"
ExecStart=/opt/tomcat/bin/startup.sh
ExecStop=/opt/tomcat/bin/shutdown.sh
[Install]
WantedBy=multi-user.target

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
