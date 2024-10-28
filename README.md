# **TSSR_PARIS_0924_P2_G2**

# Objectif principal :

- Depuis une machine Windows Server, on exécute un script PowerShell qui cible des ordinateurs Windows
- Depuis une machine Debian, on exécute un script shell qui cible des ordinateurs Ubuntu

  
# Objectif secondaire :

- Depuis un serveur, cibler une machine cliente avec un type d’OS différent

## Membre de l'organisation de l'équipe 
|Semaine     | Yagui Yolou| Hicham Zguiouar | Lassana Camara |
|:----------:|:-----------:|:---------------:|:------------------:|
|Semaine 1   |Scrum Master |Product Owner    |Scrum Master        |
|Role        |Installation et configuration VirtuelBox Debian 12,Ubuntu 22.04/24.04 et création Documents sur Github|Installation et configuration réseau VirtuelBox Windows 10|Installation et configuration réseau VirtuelBox Windows Server 2022
 |Semaine 2   |Scrum Master |Scrum Master     |Product Owner       |
|Role         |Codage Bash et Documentation  |Codage Bash| Codage Bash|
|Semaine 3    |Scrum Master |Product Owner  |Scrum Master         |
|Role         |             |                |                     |
Semaine 4     |Product Owner|Scrum Master    |Scrum Master         |
|Role         |             |                |                     |

## Prérequis 

## Installation des serveurs :
 
* **Windows Server 2022** 
* Nom : SRVWIN10 
* Compte : Administrateur
* Mot de passe : Azerty1*
* Adresse IP fixe : 172.16.10.5/24
--------------------------------------
* **Debian 12** 
* Nom : SRVLX01£
* Compte : root 
* Mot de passe : Azerty1*
* Adresse IP fixe : 172.16.10.10/24


## Installation des clients : 
* **Windows 10** 
* Nom : CLIWIN01
* Compte : wilder 
* Mot de passe : Azerty1*
* Accès avec une adresse IP SSH 
* Adresse IP fixe : 172.16.10.20/24
----------------------------------------
* **Ubuntu 22.04/24.04 LTS**
* Nom : wilder 
* Compte : CLILIN01
* Mot de passe : Azerty1*
* Accès avec une adresse IP SSH 
* Adresse IP fixe : 172.16.10.30/24

## Outils :
* Bash 
* Powershell 
* VisualCode 

# Etape du projet :

1. Installation et configuation de l'environnment 

2. Connexion des adresses IP via SSH 

3. Création de Script Bash et PowerShell 

4. Test 

5. Vérification finale de la mise en configuration 

# Choix Technique 
Pour la création de ce projet nous avons décidés via un script de pour pouvoir lancer des commandes. 








