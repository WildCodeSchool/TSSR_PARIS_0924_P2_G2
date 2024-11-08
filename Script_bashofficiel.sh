#!/bin/bash

# SCRIPT PROJET 2

# ----------------------------- variables------------------------------
#-------------------- fonctions sur les utilisateurs-------------------
#Initialisation de l'Utilisateur cible
function initialisationUtilisateur
{
read -p "Quel est l'utilisateur cible ? : " utilisateur
if [ -z $utilisateur ]
then
	clear
	echo "Veuillez rentrer un nom d'utilisateur" 
	initialisationUtilisateur
fi	
}

#Initalisation du groupe
function initialisationGroupe
{
read -p "Nom du groupe : " groupe
if [ -z $groupe ]
then
	clear
	echo "Veuillez rentrer un groupe" 
	initialisationGroupe
fi	
}
function menuMachines() 
{
while true
do
clear
lashi
  echo "Actions Ordinateur"
  echo "1. Arrêt"
  echo "2. Redémarrage"
  echo "3. Verrouillage"
  echo "4. Mise à jour du système"
  echo "5. Création de répertoire"
  echo "6. Modification de répertoire"
  echo "7. Suppression de répertoire"
  echo "8. Prise de main à distance"
  echo "9. Activation du pare-feu"
  echo "10. Désactivation du pare-feu"
  echo "11. Installation de logiciel"
  echo "12. Désinstallation de logiciel"
  echo "13. Exécution de script sur la machine distante"
  echo "14. Retour au menu précédent"
  read -p "Choisissez une option : " choix_action_ordinateur

  case $choix_action_ordinateur in
    1) sudo shutdown now ;;
    2) sudo reboot ;;
    3) gnome-screensaver-command -l ;;
    4) sudo apt update && sudo apt upgrade -y ;;
    5) read -p "Chemin du répertoire : " dossier ; mkdir -p "$dossier" ;;
    6) read -p "Répertoire à renommer : " old_dir ; read -p "Nouveau nom : " new_dir ; mv "$old_dir" "$new_dir" ;;
    7) read -p "Chemin du répertoire : " dossier ; rm -rf "$dossier" ;;
    8) read -p "Adresse IP de la machine distante : " ip ; ssh "$ip" ;;
    9) sudo ufw enable ;;
    10) sudo ufw disable ;;
    11) read -p "Nom du logiciel : " logiciel ; sudo apt install "$logiciel" ;;
    12) read -p "Nom du logiciel : " logiciel ; sudo apt remove "$logiciel" ;;
    13) read -p "Chemin du script : " script ; bash "$script" ;;
    14) retourMenuPrincipal ;;
    *) echo "Choix invalide." ; sleep 1 ; menu_action_ordinateur ;;
  esac
  pause && menu_action_ordinateur
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
  echo "Actions Utilisateur"
  echo "1. Création d'un compte local"
  echo "2. Changer le mot de passe d'un compte"
  echo "3. Suppression d'un compte utilisateur"
  echo "4. Désactivation d'un compte utilisateur"
  echo "5. Ajout à un groupe d'administration"
  echo "6. Ajout à un groupe local"
  echo "7. Retrait d'un groupe local"
  echo "8. Retour au menu précédent"
  read -p "Choisissez une option : " choix_action_utilisateur

  case $choix_action_utilisateur in
    1) read -p "Nom d'utilisateur : " utilisateur ; sudo useradd "$utilisateur" ;;
    2) read -p "Nom d'utilisateur : " utilisateur ; sudo passwd "$utilisateur" ;;
    3) read -p "Nom d'utilisateur : " utilisateur ; sudo userdel -r "$utilisateur" ;;
    4) read -p "Nom d'utilisateur : " utilisateur ; sudo usermod -L "$utilisateur" ;;
    5) read -p "Nom d'utilisateur : " utilisateur ; sudo usermod -aG sudo "$utilisateur" ;;
    6) read -p "Nom d'utilisateur : " utilisateur ; read -p "Groupe : " groupe ; sudo usermod -aG "$groupe" "$utilisateur" ;;
    7) read -p "Nom d'utilisateur : " utilisateur ; read -p "Groupe : " groupe ; sudo gpasswd -d "$utilisateur" "$groupe" ;;
    8) retourMenuPrincipal ;;
    *) echo "Choix invalide." ; sleep 1 ; menu_action_utilisateur ;;
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
  echo "Informations Utilisateur"
  echo "1. Date de dernière connexion"
  echo "2. Date de la dernière modification du mot de passe"
  echo "3. Liste des sessions ouvertes par l'utilisateur"
  echo "4. Groupes de l'utilisateur"
  echo "5. Liste des commandes utilisées par l'utilisateur"
  echo "6. Droit et permissions de l'utilisateur sur un dossier"
  echo "7. Droit et permissions de l'utilisateur sur un fichier"
  echo "8. Recherche dans log_evt.log pour un utilisateur"
  echo "9. Retour au menu précédent"
  read -p "Choisissez une option : " choix_info_utilisateur

  case $choix_info_utilisateur in
    1) lastlog -u "$utilisateur" ;;
    2) sudo chage -l "$utilisateur" | grep "Dernier changement de mot de passe" ;;
    3) who | grep "$utilisateur" ;;
    4) groups "$utilisateur" ;;
    5) history | grep "$utilisateur" ;;
    6) read -p "Chemin du dossier : " dossier ; ls -ld "$dossier" ;;
    7) read -p "Chemin du fichier : " fichier ; ls -l "$fichier" ;;
    8) grep "$utilisateur" log_evt.log ;;
    9) menuUtilisateurs ;;
    *) echo "Choix invalide." ; sleep 1 ; menuInformationsUtilisateur;;
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
echo "Informations Ordinateur"
  echo "1. Version de l'OS"
  echo "2. Nombre de disques"
  echo "3. Informations sur les partitions"
  echo "4. Espace disque restant"
  echo "5. Taille d'un dossier"
  echo "6. Liste des lecteurs montés"
  echo "7. Liste des applications/paquets installés"
  echo "8. Liste des services en cours d'exécution"
  echo "9. Liste des utilisateurs locaux"
  echo "10. Mémoire RAM totale"
  echo "11. Utilisation de la RAM"
  echo "12. Recherche dans log_evt.log pour la machine"
  echo "13. Retour au menu précédent"
  read -p "Choisissez une option : " choix_info_ordinateur

  case $choix_info_ordinateur in
    1) lsb_release -a ;;
    2) lsblk -d | grep disk ;;
    3) lsblk ;;
    4) df -h ;;
    5) read -p "Chemin du dossier : " dossier ; du -sh "$dossier" ;;
    6) mount | column -t ;;
    7) dpkg -l ;;
    8) systemctl list-units --type=service --state=running ;;
    9) cut -d: -f1 /etc/passwd ;;
    10) free -h | grep "Mem:" ;;
    11) free -h ;;
    12) grep "machine" log_evt.log ;;
    13) retourMenuPrincipal ;;
    *) echo "Choix invalide." ; sleep 1 ; menu_info_ordinateur ;;
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
