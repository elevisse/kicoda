Ici, on construit un lab ad-hoc façon ansible

Etapes à prendre en considération :
- construire l'inventaire local et des nouveaux noeuds
- installer le module communautaire community.docker
- insérer dans le playbook le démarrage des containers selon le modèle présent dans ~/docker-compose_sample.yml en forçant le mot de passe
- mettre à jour les hôtes connus dans localhost avec les empreintes de clés ssh des nouveaux containers
- copier la clé ssh du noeud local sur les containers
- ajouter les nodes et les ips sur le fichier /etc/hosts local
- tester via ansible ping les commandes ad-hoc
