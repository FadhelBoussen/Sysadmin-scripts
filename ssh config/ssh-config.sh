#!/bin/bash

read -p "Nom de l'utilisateur : " user

# Créez l'utilisateur

sudo useradd -m $user

echo "$user créé."

# Définissez le mot de passe de l'utilisateur

sudo passwd $user

# Générez une paire de clés SSH

sudo -u $user ssh-keygen -t rsa -b 4096

# Vérifiez si le répertoire .ssh existe et créez-le si nécessaire

if [ -d "/home/$user/.ssh" ]; then

    if [ -f "/home/$user/.ssh/authorized_keys" ]; then

        echo "Both directory exist."

    else

        echo "Directory exists, but authorized_keys file does not."
        touch "/home/$user/.ssh/authorized_keys"

    fi

else

    mkdir -p "/home/$user/.ssh"
        touch "/home/$user/.ssh/authorized_keys"

fi


# Ajout la clé publique à authorized_keys

cat /home/pub-rsa > "/home/$user/.ssh/authorized_keys"

# les autorisations

chmod 700 "/home/$user/.ssh"

chmod 600 "/home/$user/.ssh/authorized_keys"

