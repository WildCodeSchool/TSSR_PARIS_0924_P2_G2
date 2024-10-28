# TSSR_PARIS_0924_P2_G2
Documentation générale
Présentation du projet et objectif finaux
Objectif principal :
Création d'un script permettant l'automatisation de la gestion de postes et d'utilisateurs client.
  
Objectif secondaire :
Depuis un serveur, cibler une machine client avec un type d’OS différent.

Introduction mise en contexte
Membres du groupe de projet_2 (rôles par sprint)
Semaine 1:

Nom	Rôles	Tâche
Lassana CAMARA	Membre	Installation et config réseau vm Ubuntu
Yaguy	Membre	Installation et config réseau vm Debian 12
Hicham Zguiouar	Scrum Master	Installation et config réseau vm Windows 10
Lassana CAMARA	Membre	Installation et config réseau vm Windows Server / Doc

Semaine 2:

Nom	Rôles	Tâche
YAGUY	Scrum Master	Codage Bash
Lassana CAMARA	Membre	Heureux événement
Hicham ZGUIOUAR	Codage Bash

Semaine 3:

Nom	Rôles	Tâche
Hicham ZGUIOUAR
Lassana CAMARA
YAGUI
		
Semaine 4:

Nom	Rôles	Tâche
Hicham ZGUIOUAR	Product Owner	
Lassana CAMARA	Membre	
YAGUY	Scrum Master	

Choix techniques
Environment imposé par le client :

Nom	Fonction	Operating System	Compte	Mot de passe	Adresse IP	CIDR
SRVWIN01	Serveur	Windows Server 2022	Administrator	Azerty1*	172.16.10.5	/24
SRVLX01	Serveur	Debian 12	root	Azerty1*	172.16.10.10	/24
CLIWIN01	Client	Windows 10	wilder	Azerty1*	172.16.10.20	/24
CLILIN01	Client	Ubuntu 22.04 LTS	wilder	Azerty1*	172.16.10.30	/24
Difficultés rencontrées : problèmes techniques rencontrés
Semaine 1
Problème sur le script
Hicham n'a pas accès au github

Semaine 2
Acceder a une machine distante en SSH puis executer une commande par la suite.

Impossible d'enregistrer les fichiers log.

PowerShell's SUCKS !

Solutions trouvées : Solutions et alternatives trouvées
Semaine 1
Semaine 2
ssh -t $1@$2 $3
L'argument -t permet de demander le mot de passe pour la connexion ssh et autorise donc l'execution d'une commande sur une machine distante.

D'abord créer un dossier Documents sur le root de debian.

Semaine 3
Semaine 4
BURN PowerShell BURN !

Améliorations possibles : suggestions d’améliorations futures
Next step
Utiliser les scripts Bash dans un environment Microsoft. Utiliser les scripts PowerShell dans un environment Linux.
Documentation générale
Présentation du projet et objectif finaux
Objectif principal :
Création d'un script permettant l'automatisation de la gestion de postes et d'utilisateurs client.

Objectif secondaire :
Depuis un serveur, cibler une machine cliente avec un type d’OS différent.

Introduction mise en contexte
Membres du groupe de projet_2 (rôles par sprint)
Semaine 1:

Nom	Rôles	Tâche
Lassana CAMARA	Membre	Installation et config réseau vm Ubuntu
Yaguy	Membre	Installation et config réseau vm Debian 12
Hicham Zguiouar	Scrum Master	Installation et config réseau vm Windows 10
Lassana CAMARA	Membre	Installation et config réseau vm Windows Server / Doc

Semaine 2:

Nom	Rôles	Tâche
YAGUY	Scrum Master	Codage Bash
Lassana CAMARA	Membre	Heureux événement
Hicham ZGUIOUAR	Codage Bash

Semaine 3:

Nom	Rôles	Tâche
Hicham ZGUIOUAR
Lassana CAMARA
YAGUI
		
Semaine 4:

Nom	Rôles	Tâche
Hicham ZGUIOUAR	Product Owner	
Lassana CAMARA	Membre	
YAGUY	Scrum Master	

Choix techniques
Environment imposé par le client :

Nom	Fonction	Operating System	Compte	Mot de passe	Adresse IP	CIDR
SRVWIN01	Serveur	Windows Server 2022	Administrator	Azerty1*	172.16.10.5	/24
SRVLX01	Serveur	Debian 12	root	Azerty1*	172.16.10.10	/24
CLIWIN01	Client	Windows 10	wilder	Azerty1*	172.16.10.20	/24
CLILIN01	Client	Ubuntu 22.04 LTS	wilder	Azerty1*	172.16.10.30	/24
Difficultés rencontrées : problèmes techniques rencontrés
Semaine 1
Problème sur le script
Hicham n'a pas accès au github
Dificultés de créer toutes les branches
Yagui a réussi à créer toute les branches sauf celui de hicham dont le compte est flaqué

Semaine 2
Acceder a une machine distante en SSH puis executer une commande par la suite
Problème de connxion IP entre le server et windows 10 ( desactivation du pare feux ) 

Solutions trouvées : Solutions et alternatives trouvées
Semaine 1
Semaine 2
Problème de ping entre server et client windows 10

D'abord créer un dossier Documents sur le root de debian.

Semaine 3
Semaine 4
BURN PowerShell BURN !

Améliorations possibles : suggestions d’améliorations futures
Next step
Utiliser les scripts Bash dans un environment Microsoft. Utiliser les scripts PowerShell dans un environment Linux.
Documentation générale
Présentation du projet et objectif finaux
Objectif principal :
Création d'un script permettant l'automatisation de la gestion de postes et d'utilisateurs client.

Objectif secondaire :
Depuis un serveur, cibler une machine cliente avec un type d’OS différent.

Introduction mise en contexte
Membres du groupe de projet_2 (rôles par sprint)
Semaine 1:

Nom	Rôles	Tâche
Lassana CAMARA	Membre	Installation et config réseau vm Ubuntu
Yaguy	Membre	Installation et config réseau vm Debian 12
Hicham Zguiouar	Scrum Master	Installation et config réseau vm Windows 10
Lassana CAMARA	Membre	Installation et config réseau vm Windows Server / Doc

Semaine 2:

Nom	Rôles	Tâche
YAGUY	Scrum Master	Codage Bash
Lassana CAMARA	Membre	Heureux événement
Hicham ZGUIOUAR	Codage Bash

Semaine 3:

Nom	Rôles	Tâche
Hicham ZGUIOUAR
Lassana CAMARA
YAGUI
		
Semaine 4:

Nom	Rôles	Tâche
Hicham ZGUIOUAR	Product Owner	
Lassana CAMARA	Membre	
YAGUY	Scrum Master	

Choix techniques
Environment imposé par le client :

Nom	Fonction	Operating System	Compte	Mot de passe	Adresse IP	CIDR
SRVWIN01	Serveur	Windows Server 2022	Administrator	Azerty1*	172.16.10.5	/24
SRVLX01	Serveur	Debian 12	root	Azerty1*	172.16.10.10	/24
CLIWIN01	Client	Windows 10	wilder	Azerty1*	172.16.10.20	/24
CLILIN01	Client	Ubuntu 22.04 LTS	wilder	Azerty1*	172.16.10.30	/24
Difficultés rencontrées : problèmes techniques rencontrés

Semaine 1
Problème sur le script
Hicham n'a pas accès au github

Semaine 2
Acceder a une machine distante en SSH puis executer une commande par la suite.

Impossible d'enregistrer les fichiers log.

PowerShell's SUCKS !

Solutions trouvées : Solutions et alternatives trouvées
Semaine 1
Semaine 2
ssh -t $1@$2 $3
L'argument -t permet de demander le mot de passe pour la connexion ssh et autorise donc l'execution d'une commande sur une machine distante.

D'abord créer un dossier Documents sur le root de debian.

Semaine 3
Semaine 4
BURN PowerShell BURN !

Améliorations possibles : suggestions d’améliorations futures
Next step
Utiliser les scripts Bash dans un environment Microsoft. Utiliser les scripts PowerShell dans un environment Linux.
