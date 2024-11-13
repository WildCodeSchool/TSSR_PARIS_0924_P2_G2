#!Bin bash

						echo '$utilisateur exsiste pas et ne peut être supprimé'
					fi"
echo " $(date "+%F")_$(date "+%H:%M:%S")_$chemin  $utilisateur a été suspendu" >> /var/log/log_actions.log
}

# Fonction pour modifier un utilisateur
function modifierUtilisateur() 
{
regroupementTrois
read -p "Quel est le nouveau nom pour $utilisateur : " nouveauNom	
if [ -z $nouveauNom ] 
then 
	clear
	echo 'Veuillez choisir un nouveau nom'
	modifierUtilisateur
	else
		ssh $utilisateurSSH@$nameClient	"
							if cat /etc/passwd | grep $utilisateur > /dev/null
							then
								usermod -l $nouveauNom $utilisateur && echo '$utilisateur est maintenant $nouveauNom'
							else
							echo '$utilisateur existe pas et ne peut donc pas être modifié'
							fi"
fi
echo " $(date "+%F")_$(date "+%H:%M:%S")_$chemin $utilisateur à été renommé " >> /var/log/log_actions.log
}

# Fonction pour changer le mot de passe d'un utilisateur
function changerMotDePasse() 
{
regroupementTrois
ssh $utilisateurSSH@$nameClient	"
					if cat /etc/passwd | grep $utilisateur > /dev/null
					then
						passwd $utilisateur &> /dev/null && echo 'Mot de passe modifié avec succès'
					else
						echo '$utilisateur existe pas et ne peut donc pas être modifié'
					fi"
echo " $(date "+%F")_$(date "+%H:%M:%S")_$chemin  Le mot de passe de $utilisateur a été modifié" >> /var/log/log_actions.log
}

# Fonction pour ajouter un utilisateur à un groupe
function ajouterAuGroupe() 
{
regroupementQuatre
ssh $utilisateurSSH@$nameClient	"
					if cat /etc/passwd | grep $groupe > /dev/null
					then
					usermod -aG $groupe $utilisateur && echo '$utilisateur a été ajouté au groupe $groupe'
					else
					echo 'Le groupe $groupe existe pas'
    					fi
    					"
echo " $(date "+%F")_$(date "+%H:%M:%S")_$chemin  $utilisateur a été ajouté au groupe $groupe" >> /var/log/log_actions.log
}
# Fonction pour sortir un utilisateur d'un groupe
function sortirDuGroupe()
{
regroupementQuatre
ssh $utilisateurSSH@$nameClient 	"
					if cat /etc/passwd | grep $groupe > /dev/null
					then
					deluser $utilisateur $groupe &> /dev/null && echo '$utilisateur a été retirer du groupe $groupe'
					else
					echo 'Le groupe $groupe existe pas'
    					fi
    					"
echo " $(date "+%F")_$(date "+%H:%M:%S")_$chemin  $utilisateur a été retirer du groupe $groupe" >> /var/log/log_actions.log
}

# --------------------fonctions sur les machines-----------------

# Arrêt de la Machine
function arreter() 
{
regroupementDeux
ssh $utilisateurSSH@$nameClient "shutdown -h now" 
echo " $(date "+%F")_$(date "+%H:%M:%S")_$chemin  Heure d'arret de la machine" >> /var/log/log_actions.log
}

#Redémarrage de la Machine
function redemarrer() 
{
regroupementDeux
ssh $utilisateurSSH@$nameClient "reboot"
echo " $(date "+%F")_$(date "+%H:%M:%S")_$chemin  heure de redémarrage de la machine" >> /var/log/log_actions.log
}

#Démarrage avec Wake-on-LAN
function demarrerWol() 
{
#mac_address="00:11:22:33:44:55" # Remplacez par l'adresse MAC de la machine distante
#wol_send_command="etherwake -i enp0s3 $mac_address"
#ssh $user@serveur_wol "$wol_send_command"
#echo " $(date "+%F")_$(date "+%H:%M:%S")_$chemin Heure de démarrage grace au Wake-on-Lan" >> /var/log/log_actions.log
echo "En chantier"
}


# Mise a Jour Système
function miseAJour() 
{
regroupementDeux
ssh $utilisateurSSH@$nameClient "apt update && apt upgrade -y"
echo " $(date "+%F")_$(date "+%H:%M:%S")_$chemin  Heure des mises à jour système" >> /var/log/log_actions.log
}		

#Verrouillage
function verrouiller() 
{
regroupementDeux
ssh $utilisateurSSH@$nameClient "systemctl suspend"
echo " $(date "+%F")_$(date "+%H:%M:%S")_$chemin  Verrouillage de la session utilisateur" >> /var/log/log_actions.log
}

#Dévérrouillage
function deverrouiller() 
{
regroupementDeux
ssh $utilisateurSSH@$nameClient "systemctl suspend -i"
echo " $(date "+%F")_$(date "+%H:%M:%S")_$chemin  Dévérouillage de la session utilisateur" >> /var/log/log_actions.log
}

#Création de répertoire
function creerRepertoire() 
{
regroupementDeux
read -p 'Veuillez saisir le chemin absolue du dossier a créer : ' cheminDossier
if [ -z $cheminDossier ]
then
	clear
	creerRepertoire
else
	ssh $utilisateurSSH@$nameClient	"
						if [ -d $cheminDossier ]										
						then
						clear
							echo 'Le dossier existe déjà choisissez en un autre'
							echo 'See you ! '
							exit 
						else
							mkdir $cheminDossier && echo 'Le dossier $cheminDossier a été crée'
						fi"
fi
echo " $(date "+%F")_$(date "+%H:%M:%S")_$chemin  Création du dossier $cheminDossier" >> /var/log/log_actions.log
}

# Renommage de répertoire
function modifierRepertoire() 
{
regroupementDeux
read -p 'Veuillez saisir le chemin absolue du dossier a renommer : ' cheminDossier
read -p 'Veuillez saisir le chemin absolue pour renommer le dossier : ' dossierRenommer 
if [ -z $cheminDossier ] || [ -z dossierRenommer ]
then
	clear
	echo 
	modifierRepertoire
else
ssh $utilisateurSSH@$nameClient 	"
					if [ -d $cheminDossier ] && [ ! -d $dossierRenommer ]
					then
						mv $cheminDossier $dossierRenommer && echo 'Le dossier $cheminDossier à été renommé en $dossierRenommer'
					else
						echo 'Vérifié les chemins saisies'
					fi"
fi
echo " $(date "+%F")_$(date "+%H:%M:%S")_$chemin  Renommage du dossier $cheminDossier en $dossierRenommer" >> /var/log/log_actions.log
}

#Suppression de répertoire
function supprimerRepertoire() 
{
regroupementDeux
read -p 'Veuillez saisir le chemin absolue du dossier à supprimer : ' cheminDossier
if [ -z $cheminDossier ]
then
	clear
	supprimerRepertoire
else
	ssh $utilisateurSSH@$nameClient	"
						if [ -d $cheminDossier ]
						then
							rm -r $cheminDossier && echo 'Le dossier $cheminDossier à été supprimé'
						else
						echo 'Le dossier $cheminDossier existe pas'
						fi
						"
echo " $(date "+%F")_$(date "+%H:%M:%S")_$chemin  Suppression du Dossier $cheminDossier" >> /var/log/log_actions.log
fi
}

#Prise en Main via SSH
function prendreLaMain() 
{
regroupementDeux
ssh $utilisateurSSH@$nameClient
echo " $(date "+%F")_$(date "+%H:%M:%S")_$chemin  Connection via SSH" >> /var/log/log_actions.log
}

#Définir des règles de pare-feu (ex. avec iptables)
function definirReglesPareFeu() 
{
echo 'en travaux'
#ssh $utilisateurSSH@$nameClient "iptables -A INPUT -p tcp --dport 22 -j ACCEPT"
#ssh $utilisateurSSH@$nameClient "iptables -A INPUT -j DROP"
#echo " $(date "+%F")_$(date "+%H:%M:%S")_$chemin  firewallDefinition" >> /var/log/log_actions.log
}

#---------------------fonctions informations utilisateurs--------------

# 1 - Date de dernière connection d’un utilisateur
function derniereConnectionUtilisateur()
{
regroupementTrois
ssh $utilisateurSSH@$nameClient last $utilisateur | head -n 1 >> $chemin/export/info_$utilisateurSSH\_$(date "+%F")_$(date "+%H:%M:%S").txt
echo "Résultats enregistrés dans le fichier export"
}

# 2 - Date de dernière modification du mot de passe
function derniereModificationMotDePasse()
{
regroupementTrois
ssh $utilisateurSSH@$nameClient passwd -S $utilisateur | awk '{print $3}' >> $chemin/export/info_$utilisateurSSH\_$(date "+%F")_$(date "+%H:%M:%S").txt
echo "Résultats enregistrés dans le fichier export"
}

# 3 - Groupe d’appartenance d’un utilisateur
function groupeIDUtilisateur()
{
regroupementTrois
#ssh $utilisateurSSH@$nameClient id $utilisateur | awk '{print $2}' >> $chemin/export/info_$utilisateurSSH\_$(date "+%F")_$(date "+%H:%M:%S").txt
ssh $utilisateurSSH@$nameClient id $utilisateur >> $chemin/export/info_$utilisateurSSH\_$(date "+%F")_$(date "+%H:%M:%S").txt #a voir avec le groupe celle ci me semble plus plausible
echo "Résultats enregistrés dans le fichier export"
}

# 4 - Droits/permissions de l’utilisateur
function permissionUtilisateur()
{
regroupementTrois
ssh $utilisateurSSH@$nameClient ls -larth >> $chemin/export/info_$utilisateurSSH\_$(date "+%F")_$(date "+%H:%M:%S").txt
#ssh $utilisateurSSH@$nameClient ls -larth >> $chemin/export/info_$nameClient\_$(date "+%F")_$(date "+%H:%M:%S").txt a voir avec dom/equipe 
echo "Résultats enregistrés dans le fichier export"
}

#---------------------fonctions informations ordinateurs

# 1 - Version de l'OS
function versionOS()
{
regroupementDeux
ssh $utilisateurSSH@$nameClient lsb_release -d >> $chemin/export/info_$utilisateurSSH\_$(date "+%F")_$(date "+%H:%M:%S").txt
echo "Résultats enregistrés dans le fichier export"
}	

# 2 - Espace disque restant
function espaceDisqueRestant()
{
regroupementDeux
ssh $utilisateurSSH@$nameClient df -h >> $chemin/export/info_$utilisateurSSH\_$(date "+%F")_$(date "+%H:%M:%S").txt	
echo "Résultats enregistrés dans le fichier export"
}	

# 3 - Taille de répertoire (qui sera demandé)
function tailleRepertoire()
{
regroupementDeux
read -p "Indiquez le répertoire désiré : " repertoire
if [ -z $repertoire ]
then
	echo "Merci de rentrer un nom de répertoire"
	tailleRepertoire
else
ssh $utilisateurSSH@$nameClient	"
					if [ -d $repertoire ]
					then
						du -sh $repertoire
						sleep 5
					else
					echo "Nom de répertoire non existant"
					echo "See you ! "
					exit

					fi" > $chemin/export/info_$utilisateurSSH\_$(date "+%F")_$(date "+%H:%M:%S").txt
echo "Résultats enregistrés dans le fichier export"
fi				
}

# 4 - Liste des lecteurs 
function listeDesLecteurs()
{
regroupementDeux
ssh $utilisateurSSH@$nameClient lsblk >> $chemin/export/info_$utilisateurSSH\_$(date "+%F")_$(date "+%H:%M:%S").txt
echo "Résultats enregistrés dans le fichier export"
}
		
# 5 - Adresse IP
function adresseIP()
{
regroupementDeux
ssh $utilisateurSSH@$nameClient ip a | grep "inet" >> $chemin/export/info_$utilisateurSSH\_$(date "+%F")_$(date "+%H:%M:%S").txt
}

# 6 - Adresse MAC
function adresseMAC()
{
regroupementDeux
ssh $utilisateurSSH@$nameClient ip a | grep "link/ether" >> $chemin/export/info_$utilisateurSSH\_$(date "+%F")_$(date "+%H:%M:%S").txt
echo "Résultats enregistrés dans le fichier export"
}

# 7 - Liste des applications/paquets installés
function listeDesApplications()
{
regroupementDeux
ssh $utilisateurSSH@$nameClient	"
					dpkg --list > paquets.txt
					cat paquets.txt
					sleep 15" >> $chemin/export/info_$utilisateurSSH\_$(date "+%F")_$(date "+%H:%M:%S").txt	
echo "Résultats enregistrés dans le fichier export"	
}

# 8 - Type de CPU, nombre de coeurs ...
function informationCPU()
{
regroupementDeux
#ssh $utilisateurSSH@$nameClient cat /proc/cpuinfo >> $chemin/export/info_$utilisateurSSH\_$(date "+%F")_$(date "+%H:%M:%S").txt
ssh $utilisateurSSH@$nameClient lshw -short | grep "processor" >> $chemin/export/info_$utilisateurSSH\_$(date "+%F")_$(date "+%H:%M:%S").txt #commande michael je la trouve mieux
echo "Résultats enregistrés dans le fichier export"
}

# 9 - Mémoire RAM totale
function memoireRAMtotale()
{
regroupementDeux
ssh $utilisateurSSH@$nameClient free -h >> $chemin/export/info_$utilisateurSSH\_$(date "+%F")_$(date "+%H:%M:%S").txt
echo "Résultats enregistrés dans le fichier export"
}

# 10 - Liste des ports ouverts 
function listePortsOuverts()
{
regroupementDeux
ssh $utilisateurSSH@$nameClient ss -tulnp >> $chemin/export/info_$utilisateurSSH\_$(date "+%F")_$(date "+%H:%M:%S").txt
echo "Résultats enregistrés dans le fichier export"
}

# 11 - Statut du pare-feu (en sudo)
function statutPareFeu()
{
#regroupementDeux
#ssh $utilisateurSSH@$nameClient ufw status >> $chemin/export/info_$utilisateurSSH\_$(date "+%F")_$(date "+%H:%M:%S").txt
echo "Non fonctionnelle"
}

# 12 - Liste des utilisateurs locaux
function listeUtilisateurLocaux()
{
regroupementDeux
ssh $utilisateurSSH@$nameClient cut -d: -f1 /etc/passwd >> $chemin/export/info_$utilisateurSSH\_$(date "+%F")_$(date "+%H:%M:%S").txt
echo "Résultats enregistrés dans le fichier export"
}

#----------------------------------------------------------------------
#----------------------MENUS--------------------------------------
#---------------------Sous menu machines--------------------------
			    
			    
function menuMachines() 
{
while true
do
clear
lashi
	echo "Menu machines"
	echo " 1 - Arrêt de la machine"
	echo " 2 - Redémarrage de la machine"
	echo " 3 - Démarrage via Wake-on-LAN"
	echo " 4 - Mise à jour du système"
	echo " 5 - Verrouillage de la machine"
	echo " 6 - Dévérouillage de la machine"
	echo " 7 - Création de répertoire"
	echo " 8 - Modification de répertoire"
	echo " 9 - Suppression de répertoire"
	echo "10 - Prendre la main à distance"
	echo "11 - Définition de règles de pare-feu"
	echo "12 - Retour menu principal"
	echo "13 - Quitter"
	read -p "Choisissez une option de 1 à 13 : " choix

	    case $choix in
		1)
		arreter;;
		2)
		redemarrer;;
		3)
		demarrerWol;;
		4)
		miseAJour;;
		5)
		verrouiller;;
		6)
		deverrouiller;;
		7)
		creerRepertoire;;
		8)
		modifierRepertoire;;
		9)
		supprimerRepertoire;;
		10)
		prendreLaMain;;
		11)
		definirReglesPareFeu;;
		12) 
		retourMenuPrincipal;; 
		13)
		echo "See you!"
		exit 0;;
		*)
		echo "Option invalide. Veuillez choisir une option valide (1-11).";;
		
		esac
	read -p "Appuyez sur Entrée pour continuer..."
done
}
#---------------------Sous menu utilisateurs -------------------------------
function menuUtilisateurs() 
{
while true
do
		clear
        lashi
		echo "Menu utilisateurs"
		echo " 1 - Ajouter un utilisateur"
		echo " 2 - Supprimer un utilisateur"
		echo " 3 - Suspension d'un utilisateur"
		echo " 4 - Modifier un utilisateur"
		echo " 5 - Changer le mot de passe d'un utilisateur"
		echo " 6 - Ajouter un utilisateur à un groupe"
		echo " 7 - Sortir un utilisateur d'un groupe"
		echo " 8 - Retour menu principal"
		echo " 9 - Quitter"
		read -p "Choisissez une option : " choix

		case $choix in
			1)
			ajouterUtilisateur;;
			2)
			supprimerUtilisateur;;
			3)
			suspendreUtilisateur;;
			4)
			modifierUtilisateur;;
			5)
			changerMotDePasse;;
			6)
			ajouterAuGroupe;;
			7)
			sortirDuGroupe;;
			8)  
			retourMenuPrincipal
			sleep 5;;
			9)
			echo "See you!"
			exit 0;;
			*)
			echo "Option non valide. Veuillez saisir un nombre de 1 à 9.";;
		esac
	read -p "Appuyez sur Entrée pour continuer..."
done
}
#---------------------Sous menu informations ------------------------------
function menuInformationsUtilisateur() 
{
while true
do
clear
lashi
	echo " Quelle information souhaitez-vous obtenir ? "
	echo " 1 - Date de dernière connection d'un utilisateur "
	echo " 2 - Date de dernière modification du mot de passe "
	echo " 3 - Groupe d'appartenance d'un utilisateur " 
	echo " 4 - Droits/permissions de l'utilisateur "
	echo " 5 - Retour menu principal "
	echo " 6 - Quitter "
	read -p "Choississez une option : " choix
		case $choix in 
			1) 
			derniereConnectionUtilisateur;;
			2) 
			derniereModificationMotDePasse;;
			3) 
			groupeIDUtilisateur;;
			4)
			permissionUtilisateur;;
			5)
			retourMenuPrincipal;;
			6)
			echo "See you !"
			exit;;
			*)
			echo "Choix entre 1 et 6"
			sleep 3;;
		esac
	read -p "Appuyez sur Entrée pour continuer..."
done
}
#---------------------Sous-menu Informations Machine ------------------------------
function menuInformationsMachines() 
{
while true
do
clear
lashi
	echo " Quelle information souhaitez-vous obtenir ? "
	echo " 1 - Version de l'OS "
	echo " 2 - Espace disque restant "
	echo " 3 - Taille de répertoire (qui sera demandé) "
	echo " 4 - Liste des lecteurs "
	echo " 5 - Adresse IP "
	echo " 6 - Adresse Mac "
	echo " 7 - Liste des applications/paquets installées "
	echo " 8 - Type de CPU, nombre de coeurs ... "
	echo " 9 - Mémoire RAM totale "
	echo " 10 - Liste des ports ouverts "
	echo " 11 - Statut du pare-feu "
	echo " 12 - Liste des utilisateurs locaux "
	echo " 13 - Retour menu principal "
	echo " 14 - Quitter "
	read -p "Choississez une option : " choix
		case $choix in
			1)
			versionOS;;
			2)
			espaceDisqueRestant;;
			3)
			tailleRepertoire;;
			4)
			listeDesLecteurs;;
			5)
			adresseIP;;
			6)
			adresseMAC;; 
			7)
			listeDesApplications;;
			8)
			informationCPU;; 
			9)
			memoireRAMtotale;;
			10)
			listePortsOuverts;;
			11)
			statutPareFeu;;
			12)
			listeUtilisateurLocaux;; 
			13)
			retourMenuPrincipal;;
			14)
			echo "See you !"
			exit;;
			*)
			echo "Choix entre 1 et 14"
			sleep 3;;
		esac
	read -p "Appuyez sur Entrée pour continuer..."
done
}
#---------------------fonction retour menu principal --------------------------------
function retourMenuPrincipal() 
{
while true 
do
clear
lashi
	echo "Menu principal"
	echo " 1 - Menu utilisateurs"
	echo " 2 - Menu machines"
	echo " 3 - Menu informations Utilisateur"
	echo " 4 - Menu informations Machines"
	echo " 5 - Quitter"
	read -p "Choisissez une option : " choix
	case $choix in
		1)
		menuUtilisateurs;;
		2) 
		menuMachines;;
		3)
		menuInformationsUtilisateur;;
		4)
		menuInformationsMachines;;
		5)	
		echo "See you !"
		exit 0;;
		*) 
		echo "Option invalide, choix de 1 à 5"
		sleep 3;;
	esac	
done
}

#---------------------- Affichage principal LASHI ------------------------------------------
function lashi()
{
echo -e "\e[32m                |           /\      _________   |        |   | \e[0m"
echo -e "\e[32m                |          /  \     |           |        |   | \e[0m"
echo -e '\e[32m                |         /    \    |           |        |   | \e[0m'
echo -e "\e[32m                |        /______\   |________   |________|   | \e[0m"
echo -e "\e[32m                |       /        \          |   |        |   | \e[0m"
echo -e "\e[32m                |      /          \         | - |        |   | \e[0m"
echo -e "\e[32m                |_____/            \________|   |        |   | \e[0m"

echo -e "\e[34m-----------------------------------------------------------------------
Bonjour, bienvenue dans LASHI, merci d'entrer les identifiants à cibler.
-----------------------------------------------------------------------\e[0m"
}

#---------------------Main-menu principal ------------------------------------------
while true
do
clear
lashi
	echo "Menu principal"
	echo " 1 - Menu utilisateurs"
	echo " 2 - Menu machines"
	echo " 3 - Menu informations Utilisateur"
	echo " 4 - Menu informations Machines"
	echo " 5 - Quitter"
	read -p "Choisissez une option : " choix
		case $choix in
			1)
			menuUtilisateurs;;
			2) 
			menuMachines;;
			3)
			menuInformationsUtilisateur;;
			4)
			menuInformationsMachines;;
			5)	
			echo "See you !"
			exit 0;;
			*) 
			echo "Option invalide, choix de 1 à 5"
			sleep 3;;
		esac
done
