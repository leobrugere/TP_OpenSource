# TP Ansible
> Ce TP a été réalisé en collaboration avec Léo BRUGERE et Kélian GARDIN

## Adapter le projet à votre configuration

Commencer par modifier les adresses IP des fichiers *Devops* se trouvant dans le dossier *host_vars*. (Un fichier par machine)

Si vous souhaitez changer l'utilisateur ou le mot de passe de la base de donnée, rendez-vous dans le fichier *roles/mysql/tasks/mysql.yml* dans les paramètres **name** et **password** :
```
- mysql_user:
    name: Username
    password: Password
```
Si vous modifier ces informations, pensez également à les changer dans le fichier roles/web/template/wp-config.php
Utilisateur de la base de données MySQL. :
```define( 'DB_USER', 'Username' );```
Mot de passe de la base de données MySQL. :
```define( 'DB_PASSWORD', 'Password' );```

## Lancer le playbook
Pour lancer le playbook, placez vous à la racine du projet et lancer la commande suivante :
```
ansible-playbook -i inventory.ini site.yml
```
Si vous ne vous connectez pas avec des clés ssh, utilisez l'argument **-ask-pass** à la commande précédente


## Notre configuration

|Nom             |Adresse IP             |Fonctionnalité          |
|----------------|-----------------------|------------------------|
|DevOps2         |40.117.87.117          |Base de données MySQL   |
|DevOps3         |104.45.136.44          |Apache/PHP/FTP/Wordpress|

## Tester le playbook
Rendez vous sur l'adresse IP de la machine DevOps3
>Dans notre cas, rendez vous sur http://104.45.136.44
