#!/usr/bin/env bash

# Profil ABT
PROJECT_NAME=$1
PROFILE=$2

# Mise à jour des dépots
apt -y update

# Configuration de la timezone
echo "Europe/Paris" > /etc/timezone
apt -y install tzdata
dpkg-reconfigure -f noninteractive tzdata

# Installation de Apache et PHP
apt -y install libapache2-mod-php5 php5-cli rpl
a2enmod headers
a2enmod rewrite
rpl 'DocumentRoot /var/www/html' 'DocumentRoot /vagrant/src/web' /etc/apache2/sites-available/000-default.conf
service apache2 restart

# Configuration du projet
apt -y install ant
cd /vagrant
ABT_USER="$PROFILE" ./composer.phar install --prefer-dist --no-progress
ant configure build -Dprofile="$PROFILE"

# Mise à disposition du projet dans Apache
ln -sf /vagrant/src/web /var/www/html/flarum
rm -f /var/www/html/index.html

# Informations
echo
echo -e "Le site est disponible à l'adresse : http://$PROJECT_NAME.vagrant.test"
