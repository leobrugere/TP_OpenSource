# Synthèse du projet Open Source !

Bonjour à vous,
Ici, vous trouverez une petite synthèse du projet que l'on souhaite réaliser pour le cours d'Open Source :-)

## Le projet
Le début de notre projet commence avec **Vagrant**. <br>Ce que l'on faire c'est, à travers des **Vagrantfile**, lancer des machines virtuelles. <br>Ces machines virtuelles seront pré-configurées et seront lancées sous Azure.

Ensuite, les VM lancées auront **Ansible**, **Keepalived** et **Nginx** d'installés.

Ansible sera là pour automatiser le déploiement de nos services (qui restent à définir) <br>Keepalive permettra de gérer la Haute Disponibilité (les deux serveurs ou VM auront la même IP et que si l'un tombe, l'autre prenne le relais) <br>Nginx fera le load balancing et de rediriger en fonction de la charge de l'une ou de l'autre.
