# net.constructions-incongrues.skel

## Installation de Composer

```bash
php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php -r "if (hash_file('SHA384', 'composer-setup.php') === '55d6ead61b29c7bdee5cccfb50076874187bd9f21f65d8991d46ec5cc90518f447387fb9f76ebae1fbbacf329e583e30') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
sudo php composer-setup.php --install-dir=/usr/local/bin --filename=composer
```

## Création d'un nouveau projet

```bash
composer create-project --stability=dev --repository='{"type": "git", "url": "git@github.com:constructions-incongrues/net.constructions-incongrues.skel.git"}' constructions-incongrues/net.constructions-incongrues.skel path
```

```bash
cd path
git init
```
- Éditer le fichier `ci.yml`

## Démarrage de la machine virtuelle

```bash
vagrant up
```
