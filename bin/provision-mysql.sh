#!/usr/bin/env bash

# Profil ABT
PROFILE=${1:=vagrant}
echo "profile=$PROFILE"

# Mise à jour des dépots
apt -y update

# Configuration de la timezone
echo "Europe/Paris" > /etc/timezone
apt-get install -y tzdata
dpkg-reconfigure -f noninteractive tzdata

# Installation de Apache et PHP
apt-get -y install libapache2-mod-php5 php5-cli
a2enmod headers
a2enmod rewrite
service apache2 restart

# Configuration du projet
apt-get install -y ant
cd /vagrant
./composer.phar install --prefer-dist --no-progress
ant configure build -Dprofile=${PROFILE}

# Mise à disposition du projet dans Apache
ln -sf /vagrant/src/flarum /var/www/html/flarum
rm -f /var/www/html/index.html

# Informations
echo
echo -e "Le site est disponible à l'adresse : http://skel.vagrant.test/frontend_dev.php"
echo -e "PhpMyAdmin est disponible à l'adresse : http://skel.vagrant.test/phpmyadmin/ (root / root)"
