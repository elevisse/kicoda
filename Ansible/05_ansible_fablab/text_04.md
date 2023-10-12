Création playbook : empreintes ssh et clés

Actions à réaliser :
- récupérer les clés ssh sur l'hôte local en lookup via la commande ssh-keyscan
- boucler sur les hôtes du groupe nodes
- ajouter la clé publique sur chaque hôte distant
- noter chaque node dans /etc/hosts
- créer l'inventaire basique dans /etc/ansible/hosts

Sources :
- [known_hosts](https://docs.ansible.com/ansible/latest/collections/ansible/builtin/known_hosts_module.html)
- [pipe_lookup](https://docs.ansible.com/ansible/latest/collections/ansible/builtin/pipe_lookup.html)
- [ansible.posix](https://docs.ansible.com/ansible/latest/collections/ansible/posix/authorized_key_module.html)
- [lineinfile](https://docs.ansible.com/ansible/latest/collections/ansible/builtin/lineinfile_module.html)

<br>

<details>

<summary>Solution</summary>

Gestion playbook
Utiliser l'éditeur pour ajouter les lignes au fichier playbook/main.yml
```plain
...


# Cette partie gère l'obtention des clés
- name: Mise en place reseau local et des images docker
  hosts: nodes
  gather_facts: no
  tasks:
  - name: remplissage fichier hosts
    ansible.builtin.lineinfile:
      path: /etc/hosts
      search_string: "{{ ansible_host }}"
      line: "{{ ansible_host }} {{ inventory_hostname }}"
      owner: root
      group: root
      mode: '0644'
    delegate_to: localhost
    connection: local
  - name: obtention cles ssh
    ansible.builtin.known_hosts:
      name: "{{ ansible_host }}"
      key: "{{ lookup('ansible.builtin.pipe', 'ssh-keyscan ' + ansible_host) }}"
    delegate_to: localhost
    connection: local
  - name: depose de la cle publique
    ansible.posix.authorized_key:
      user: root
      state: present
      key: "{{ lookup('file', '~/.ssh/id_rsa.pub') }}"
    vars:
      ansible_password: "{{ root_password }}"
  - name: creation dossier inventaire basique
    ansible.builtin.file:
      path: /etc/ansible
      state: directory
      mode: '0755'
    delegate_to: localhost
    connection: local
    when: inventory_hostname == groups['nodes'][0]
  - name: remplissage inventaire basique
    ansible.builtin.lineinfile:
      path: /etc/ansible/hosts
      search_string: "{{ inventory_hostname }}"
      line: "{{ inventory_hostname }}"
      create: true
      owner: root
      group: root
      mode: '0644'
    delegate_to: localhost
    connection: local

```
