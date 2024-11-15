# Guide de l'utilisateur :  
+Bienvenue dans ce guide d'utilisation dédié aux scripts Bash et PowerShell pour de la prise en   main à distance sur des machines clientes.  
# Introduction : aperçu du système et de son objectif  
+Pour ce projet, nous avons créé un réseau local de quatre machines :  
        |Machines           | 	Adresses IP|
            |Win Sever 2022  |	172.16.10.5/24|
            |Debian 12	172.16.10.10/24|
            |Win 10	172.16.10.20/24|
            |Ubuntu 22.04     |	172.16.10.30/24|

+Vous avez accès ici à deux scripts. Le premier est un script rédigé en Bash, utilisable depuis un PC 
+serveur Debian vers un PC client Ubuntu. Le second est un script rédigé en PowerShell et   +utilisable depuis un PC serveur Windows Server 2022 vers un PC client Windows 10. Ces deux   +scripts ont les mêmes fonctionnalités :  
+ Réalisations d'actions sur le PC client depuis le PC serveur avec une journalisation de ces  actions sur un log.  
      +L’ensemble des actions demandées et effectuées seront journalisées dans un fichier stocké sur      le serveur nommé log_actions.log  
      + Sur le serveur Windows, dans C:\Windows\System32\LogFiles  
      +- Sur le serveur Debian, dans /var/log   
+ Les actions seront enregistrées sous la forme :  
+ Date-Heure-Utilisateur-Cible-TypeDAction   
+ Récupération des informations du PC client depuis le PC pc serveur avec un export de ces   informations.  
+ Les informations qui seront demandées seront automatiquement exportées dans un   fichier d’information nommé info_Cible_Date_Heure.txt   
+ Il sera stocké :  
+ Sur le serveur Windows, dans C:\Users\Utilisateur\Desktop\export  
+ Sur le serveur Debian, dans /home/Utilisateur/   
# Utilisation de base : comment utiliser les fonctionnalités clés  
+ Présentation :    
+ Les deux scripts sont commentés de manière à permettre à tout utilisateur de se retrouver dans les   commandes. Ces deux scripts ont la même structure qui se découpe comme suit :  
+ une partie dédiée à la création des variables utilisées tout au long du script   
+ une partie dédiée à la création des fonctions pour les actions effectuées et les informations à   récupérer   
+ une partie concernant la création des menus des scripts   
+ la partie principale, où l'on appelle l'ensemble des fonctions de manière à obtenir des scripts   clairs et fonctionnels.   
+ Voici l'ensemble des fonctionnalités que vous retrouverez dans ces scripts :  
+ Actions sur les utilisateurs  
•	+ Ajout d'utilisateur   
•	+ Suppression d'utilisateur   
•	+ Suspension d'utilisateur   
•	+ Modification d'utilisateur   
•	+ Changement de mot de passe   
•	+ Ajout à un groupe   
•	+ Sortie d’un groupe   
•	+ Actions sur les ordinateurs clients  
•	+ Arrêt 
•	+ Redémarrage  
•	+ Verrouillage   
•	+ Création de répertoire  
•	+ Modification de répertoire   
•	+ Suppression de répertoire   
•	+ Prendre la main à distance   
•	+ Informations sur les utilisateurs  
•	+ Date de dernière connection d’un utilisateur   
•	+ Date de dernière modification du mot de passe   
•	+ Groupe d’appartenance d’un utilisateur   
•	+ Droits/permissions de l’utilisateur   
•	+ Informations sur les ordinateurs  
•	+ Version de l'OS   
•	+  Espace disque restant   
•	+ Taille de répertoire (qui sera demandé)   
•	+  Liste des lecteurs   
•	+  Adresse IP   
•	+ Adresse Mac   
•	+ Liste des applications/paquets installées   
•	+ Type de CPU, nombre de coeurs, etc.   
•	+ Mémoire RAM totale   
•	+ Liste des ports ouverts   
•	+ Statut du pare-feu   
•	+ Liste des utilisateurs locaux   
# Fonctionnalités de prise en main à distance :  
## Sous Linux :  
+ Sous Bash, nous allons utiliser ici un tunnel SSH. Cette commande nous permet de prendre le       + contrôle d'un ordinateur distant dont nous connaissons le nom d'utilisateur et l'adresse IP. On       + l'affiche de la manière suivante :  
+ ssh user@ip "instructions"  
+ Dans le cadre des actions, il faut renseigner le dossier /var/log où seront enregistrés les actions   
+ effectuées. Dans le cadre de informations, il faudra renseigner /home/utilisateur, avec la création  + d'un dossier export dans ce dossier.  
## Sous Windows :  
+ Pour le script PowerShell, on utilise WinRm qui permet de prendr ele contrôle à distance. Une     + fois WinRm configuré (voir le guide d'installation), nous allons mettre chaque commande dans   + une structure très particulière :  
+ Invoke-Command -ComputerName "NomDuPC" -Credential "NomUtilisateur" -         + ScriptBlock { "instructions"}  
+ Ainsi, avec connaissance du nom de l'ordinateur client distant, de nom de son utilisateur (autorisé   + au préalable dans la configuration de WinRm), nous pouvons rentrer une série d'instructions dans   + la partie scriptblock qui seront effectuées depuis l'ordinateur serveur vers le client, le tout à         + distance.  
+ Vous trouverez comment renommer vos ordinateurs dans la partie du guide d'installation prévue à   + cet effet.  
+ Pour l'export de données, il vous faudra créer au préalable le dossier export dans votre bureau.   + Attention à votre saisie !  
## Lancement du script :  
+ Afin de pouvoir utiliser ce script, veuillez vous référer au guide d'installation qui vous expliquera   + comment configurer ses machines de manières à pouvoir prendre le contrôle des PCs clients        + depuis les PCs serveurs.  
+ Pour lancer le script (Bash ou PowerShell), il vous suffit de vous placer dans votre interpréteur de   + commande, en administrateur et dans le dossier où se trouve le script téléchargé. Il suffit ensuite   + d'écrire : ./"NomDuScript"  
+ Le menu détaille l'ensemble des actions possibles, il vous faudra taper le numéro correspondant à   + l'action de votre choix, tout est automatique !  
+ Lors de certaines erreurs de saisies de votre part, le script peut se fermer. Il faudra alors le            + relancer et recommencer proprement, attention aux erreurs de saisie !  
## Utilisation avancée :  
+ Ce projet est fonctionnel et peut servir de base à de nombreuses applications. Il peut être utilisé et   + amélioré afin de croiser les scripts sur différents OS. Par exemple, de Debian à Windows 10 et de   + Windows Server à Ubuntu. Il faudra pour cela rajouter les commandes nécessaires directement    + dans le script.  
+ Nous recommandons cependant une bonne compréhension du script avant toute tentative de        + modification.  
## Dépannage : solutions aux problèmes connus et communs  
•	+ Je n'arrive pas à mettre mes machines en réseau.  
+ ==> vous trouverez la méthode dans le guide d'installation.  
•	+ Mon WinRm ne se configure pas.  
+ ==> retrouvez l'ensemble des étapes de configuration dans le guide d'installation.  
•	+ Mon script ne se lance pas.  
+ ==> vérifiez l'orthographe de votre saisie,  
+ ==> vérifiez que vous êtes bien en administrateur,  
+ ==> vérifiez que vous pétes bien dans le dossier où se trouve le script avant de le lancer.  
•	+ L'export de mes informations ne fonctionne pas. ==> Vérifier que le dossier export a bien   + été créé sur le bureau avant de lancer le script.  

