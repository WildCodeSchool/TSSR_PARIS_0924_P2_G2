## Arborescence

- ### 1. Cible utilisateur 
  - #### 1. Information
    - 1. Date de dernière connexion
    - 2. Date de la dernière modification du mot de passe
    - 3. Liste des sessions ouvertes par l'utilisateur
    - 6. Droit et permissions de l'utilisateur sur un dossier 
    - 7. Droit et permissions de l'utilisateur sur un fichier
    - 8. Recherche des événements dans le fichier log_evt.log pour un utilisateur
    - 9. Retour au menu précédent

  - #### 2. Action
    - 1. Création de compte utilisateur local
    - 2. Changer le mot de passe
    - 3. Suppression d'un compte utilisateur local
    - 4. Désactivation d'un compte utilisateur local
    - 5. Ajout a un groupe d'administration
    - 6. Ajout a un groupe local
    - 7. Sortie d'un groupe local
    - 8. Retour au menu précédent

  - #### 3. Retour au menu précédent

- ### 2. Cible Ordinateur
  - #### 1. Information
    - 1. Version de l'OS
    - 2. Nombre de d'interface
    - 3. Adresse Ip de chaque interface
    - 4. Adresse MAC
    - 5. Liste des applications/paquets installées
    - 6. Type de CPU, nombres de coeurs, etc...
    - 7. Liste des utilisateurs locaux
    - 8. Memoire RAM totaL
    - 9. Utilisation de la RAM
    - 10. Utilisation des disques
    - 11. Recherche des événements dans le fichier log_evt.log pour la machine
    - 12. Utilisation des Processeur
    - 13. Liste des ports ouverts
    - 14. Statuts du pare feux
    - 15. Retour au menu précédent

  - #### 2. Action

    - 1. Arrêt
    - 2. Redémarrage
    - 3. Verrouillage
    - 4. Mise a jour du système
    - 5. Creation de repertoire
    - 6. Definition de regle de pare feux
    - 7. Suppression d'un repertoire
    - 8. Prise de main a distance ( GUI)
    - 9. Activation du pare-feu
    - 10. Désactivation du pare-feu
    - 11. Installation de logiciel
    - 12. Désinstallation de logiciel
    - 13. Execution de script sur la machine distante
    - 14. Retour au menu précédent

  - #### 3. Retour au menu précédent

Comment l'utiliser
Pour utiliser LASHI, une fois le script lancé il vous suffit de naviguer dans les menu en tapant le numero correspondant aux choix que voulez voulez effectuer.

au lancement du script il vous seras demander d'entrer un nom d'utilisateur et de cibler une machine, pour viser la machine il faudra entrer l'adresse IP de la machine distante

Par exemple si vous voulez desactiver le par feu vous devrez effectuer ces action :

taper 2 pour cibler un ordinateur
taper 2 pour acceder aux actions a effectuer
taper 10 pour desactiver le par feu
Utilisation avancée
vous pouvez retrouver 2 fichiers d'information

info_utilisateurs_dates.txt qui enrengistre toutes les informations que vous avez demander qui ce trouve dans C:\Users\Administrator\Documents pour windows et pour Linux il ce trouve dans /home/Documents/

log_evt.log qui enrengistre toutes les activité comme les actions et demande d'information qui ont été effectué qui ce trouve dans C:\Windows\System32\LogFiles et pour linux il ce trouve dans /var/log
