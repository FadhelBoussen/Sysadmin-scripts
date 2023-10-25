#!/bin/bash

# Répertoire de destination pour les sauvegardes
BACKUP_DIR="/var/opt/gitlab/backups"

# Nom du fichier de sauvegarde
TIMESTAMP=$(date +"%Y%m%d%H%M%S")
BACKUP_FILENAME="gitlab_backup_$TIMESTAMP.tar"

# Arrêter GitLab
sudo gitlab-ctl stop

# Effectuer la sauvegarde
sudo gitlab-rake gitlab:backup:create
sudo mv $BACKUP_DIR/* $BACKUP_FILENAME

# Redémarrer GitLab
sudo gitlab-ctl start

# Transférer la sauvegarde vers un emplacement distant (exemple : serveur SSH)
REMOTE_USER="utilisateur-ssh"
REMOTE_HOST="adresse-ssh"
REMOTE_DIR="/chemin/vers/dossier/destination"

# Utilisez scp pour copier la sauvegarde vers le serveur distant
scp $BACKUP_FILENAME $REMOTE_USER@$REMOTE_HOST:$REMOTE_DIR

# Supprimer la sauvegarde locale (facultatif, dépend de votre politique de conservation)
rm $BACKUP_FILENAME

echo "Sauvegarde GitLab terminée et transférée vers $REMOTE_USER@$REMOTE_HOST:$REMOTE_DIR"
