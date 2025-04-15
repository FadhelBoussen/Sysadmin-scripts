#!/bin/bash

apt update
apt upgrade -y

mv /etc/apt/sources.list.d/debian-buster.list /etc/apt/sources.list.d/debian-bullseye.list

sudo tee /etc/apt/sources.list.d/debian-bullseye.list > /dev/null <<EOF
deb http://deb.debian.org/debian/ bullseye main
deb-src http://deb.debian.org/debian/ bullseye main
deb http://security.debian.org/ bullseye-security main
deb-src http://security.debian.org/ bullseye-security main
deb http://deb.debian.org/debian/ bullseye-updates main
deb-src http://deb.debian.org/debian/ bullseye-updates main
EOF

apt update

apt upgrade

read -p "Le système sera redémarré pour appliquer les changements. Souhaitez-vous continuer ? (y/n) " confirm
if [[ "$confirm" == "y" || "$confirm" == "Y" ]]; then
    sudo reboot
else
    echo "Le redémarrage a été annulé."
fi
