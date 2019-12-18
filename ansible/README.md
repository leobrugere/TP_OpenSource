# Ansible_tp

 - Il suffit pour le faire fonctionner de cloner  le répo. 
 - D'installer ansible en suivant la documentation officiel suivant votre distribution.
 - Modifier les ip des machines dans les fichiers ce situant dans le dossier :
> ansible_tp/host_vars/{machine1.yml, machine2.yml, machine3.yml}
 - Rentrer vos machines dans les groupes dans le fichiers suivants :
> ansible_tp/inventory.ini
  
Une fois ceci fais il suffit d'ouvrir un terminal et d’effectuer la commande suivante

    > ansible-playbook ./plays/site.yml 

En fonction du type de connection que vous aurez choisis avec les Vm (ssh ou password) les options suivantes

    > --ask-password

Et enfin l'option 

    > --ask-sudo-password

si la validation du sudo et nécessaire (normalement pas nécessaire)
Le mot de passe sudo est normalement le même que le mot de passe par défault SSH

Pour plus d'info il est possible de me contacter a l’adresse mail suivante :

 - paulmichel.garzaro@ynov.com