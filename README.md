# Documentation générale  
  Présentation du projet et objectif finaux  

---------
# Objectif principal :  
Création d'un script permettant l'automatisation de la gestion de postes et d'utilisateurs client.  

---------
# Objectif secondaire :  
  Depuis un serveur, cibler une machine cliente avec un type d’OS différent.  

---------
# Introduction mise en contexte  
 Membres du groupe de projet_2 (rôles par sprint)  

--------
# Semaine 1:  
--------

  |Nom             |Rôles	  |Tâche                                  |
  |:--|:--|:--|
  |Lassana CAMARA  |Membre  |Installation et config réseau vm Ubuntu|
  |Yaguy	|Membre	 |Installation et config réseau vm Debian 12      |
  |Hicham Zguiouar |Scrum Master|Installation et config réseau vm Windows 10|
  |Lassana CAMARA  |Membre|Installation et config réseau vm Windows Server / Doc |

# Semaine 2:

|Nom	|Rôles	|Tâche  |
|:--|:---|:---|
|YAGUY	 |Scrum Master	|Codage Bash  |
|Lassana CAMARA|Membre	|codage powershell   |
|Hicham ZGUIOUAR	|codage Bash  |    |


# Semaine 3:  

|Nom	 |Rôles	  |Tâche  |
|:-|:-|:-|
|Hicham ZGUIOUAR  |  |  |
|Lassana CAMARA   |  |  |
 
		
# Semaine 4:  

|Nom	 |Rôles	  |Tâche  |
|:--|:--|:--|
|Hicham ZGUIOUAR|Product Owner|   |
|Lassana CAMARA	|Membre	      |   |

-------
# Choix techniques  
Environment imposé par le client :  

--------
Nom	Fonction	Operating System	Compte	Mot de passe	Adresse IP	CIDR    
SRVWIN01	Serveur	Windows Server 2022	Administrator	Azerty1*	172.16.10.5	/24    
SRVLX01	Serveur	Debian 12	root	Azerty1*	172.16.10.10	/24  
CLIWIN01	Client	Windows 10	wilder	Azerty1*	172.16.10.20/24  
CLILIN01	Client	Ubuntu 22.04 LTS	wilder	Azerty1*	172.16.10.30/24  
Difficultés rencontrées : problèmes techniques rencontrés  

--------
# Semaine 1  
Problème sur le script  
Hicham n'a pas accès au github  

--------
# Semaine 2  
Acceder a une machine distante en SSH puis executer une commande par la suite.  
Impossible d'enregistrer les fichiers log.  
difficulté d'assemblée des series de script  
difficulte de fixer une ipv4 sur debian server  

-------
# semaine 3  
l'equipe se retrouve a 2 suite a une decision injuste et unilaterale de la formatrice afin de favoriser certain  
script bash finalisé mais des erreurs de synthaxe a repetition debugage en cours  
commencement du script powershell par Lassagna et des mises en ligne des documents sur github  

--------
# Semaine 4  
finalisation des sript et application sur les differents couches OS  
