# SCRIPT PROJET 2

# ----------------------------- Variables ------------------------------
#-------------------- Fonctions sur les utilisateurs-------------------
function Lashi {
    Write-Host "                |           /\      _________   |        |   | " -ForegroundColor Green
    Write-Host "                |          /  \     |           |        |   | " -ForegroundColor Green
    Write-Host '                |         /    \    |           |        |   | ' -ForegroundColor Green
    Write-Host "                |        /______\   |________   |________|   | " -ForegroundColor Green
    Write-Host "                |       /        \          |   |        |   | " -ForegroundColor Green
    Write-Host "                |      /          \         | - |        |   | " -ForegroundColor Green
    Write-Host "                |_____/            \________|   |        |   | " -ForegroundColor Green
    Write-Host "-----------------------------------------------------------------------" -ForegroundColor Blue
    Write-Host "Bonjour, bienvenue dans LASHI, merci d'entrer les identifiants à cibler." -ForegroundColor Blue
    Write-Host "-----------------------------------------------------------------------" -ForegroundColor Blue
}

# Menu des machines
function Menu-Machines {
    while ($true) {
        Clear-Host
        Lashi
        Write-Host "Actions Ordinateur"
        Write-Host " "
        Write-Host "1. Arrêt"
        Write-Host "2. Redémarrage"
        Write-Host "3. Verrouillage"
        Write-Host "4. Mise à jour du système"
        Write-Host "5. Création de répertoire"
        Write-Host "6. Modification de répertoire"
        Write-Host "7. Suppression de répertoire"
        Write-Host "8. Prise de main à distance"
        Write-Host "9. Activation du pare-feu"
        Write-Host "10. Désactivation du pare-feu"
        Write-Host "11. Installation de logiciel"
        Write-Host "12. Désinstallation de logiciel"
        Write-Host "13. Exécution de script sur la machine distante"
        Write-Host "14. Retour au menu précédent"
        Write-Host " "
        $choix_action_ordinateur = Read-Host -Prompt "Choisissez une option"

        switch ($choix_action_ordinateur) {
            1 { Stop-Computer -Force }
            2 { Restart-Computer }
            3 { rundll32.exe user32.dll, LockWorkStation }
            4 { Start-Process -FilePath "powershell.exe" -ArgumentList "Install-Package -Name PackageName" -Verb RunAs }
            5 {                
                # Demander à l'utilisateur de saisir le chemin du répertoire
                $chemin = Read-Host "Veuillez entrer le chemin où vous souhaitez créer le répertoire"

                # Demander à l'utilisateur de saisir le nom du répertoire
                $nomRepertoire = Read-Host "Veuillez entrer le nom du répertoire à créer"

                # Combiner le chemin et le nom du répertoire
                $cheminComplet = Join-Path -Path $chemin -ChildPath $nomRepertoire

                # Vérifier si le répertoire existe déjà
                if (-Not (Test-Path -Path $cheminComplet)) 
                    {
                # Créer le répertoire
                New-Item -ItemType Directory -Path $cheminComplet
                Write-Host "Le répertoire '$nomRepertoire' a été créé avec succès à l'emplacement : $cheminComplet"
                    Start-Sleep -Seconds 5
                    } else 
                 {
                Write-Host "Le répertoire '$nomRepertoire' existe déjà à l'emplacement : $cheminComplet"
                Start-Sleep -Seconds 5
                 }
                }
            6 {
                $oldDir = Read-Host -Prompt "Répertoire à renommer"
                $newDir = Read-Host -Prompt "Nouveau nom"
                Rename-Item -Path $oldDir -NewName $newDir
            }
            7 {
                $dossier = Read-Host -Prompt "Chemin du répertoire"
                Remove-Item -Path $dossier -Recurse -Force
            }
            8 {
                $ip = Read-Host -Prompt "Adresse IP de la machine distante"
                Start-Process "mstsc" -ArgumentList "/v:$ip"
            }
            9 { Set-NetFirewallProfile -Profile Public, Private, Domain -Enabled True }
            10 { Set-NetFirewallProfile -Profile Public, Private, Domain -Enabled False }
            11 {
                $logiciel = Read-Host -Prompt "Nom du logiciel"
                Install-Package -Name $logiciel
            }
            12 {
                $logiciel = Read-Host -Prompt "Nom du logiciel"
                Uninstall-Package -Name $logiciel
            }
            13 {
                $script = Read-Host -Prompt "Chemin du script"
                Invoke-Expression $script
            }
            14 { return }
            default {
                Write-Host "Choix invalide."
                Start-Sleep -Seconds 1
            }
        }
    }
}

function menu-Informations-machines {
    while ($true) {
        Clear-Host
        Lashi
        Write-Host "Informations Ordinateur"
        Write-Host " "
        Write-Host "1. Version de l'OS"
        Write-Host "2. Nombre de disques"
        Write-Host "3. Informations sur les partitions"
        Write-Host "4. Espace disque restant"
        Write-Host "5. Taille d'un dossier"
        Write-Host "6. Liste des lecteurs montés"
        Write-Host "7. Liste des applications/paquets installés"
        Write-Host "8. Liste des services en cours d'exécution"
        Write-Host "9. Liste des utilisateurs locaux"
        Write-Host "10. Mémoire RAM totale"
        Write-Host "11. Utilisation de la RAM"
        Write-Host "12. Recherche dans log_evt.log pour la machine"
        Write-Host "13. Retour au menu précédent"
        Write-Host " "
        $choix_info_ordinateur = Read-Host "Choisissez une option"

        switch ($choix_info_ordinateur) {
            1 { Get-WmiObject -Class Win32_OperatingSystem | Select-Object -Property Caption, Version }
            2 { Get-PhysicalDisk | Select-Object -Property DeviceID, MediaType, Size }
            3 { Get-Partition | Select-Object -Property DriveLetter, Size, Type }
            4 { Get-PSDrive -PSProvider FileSystem | Select-Object -Property Name, Used, Free }
            5 { 
                $dossier = Read-Host "Chemin du dossier"
                Get-ChildItem -Path $dossier -Recurse | Measure-Object -Property Length -Sum
            }
            6 { Get-Volume | Select-Object -Property DriveLetter, FileSystemLabel, SizeRemaining }
            7 { Get-Package }
            8 { Get-Service | Where-Object { $_.Status -eq 'Running' } }
            9 { Get-LocalUser | Select-Object -Property Name }
            10 { Get-WmiObject -Class Win32_PhysicalMemory | Measure-Object -Property Capacity -Sum }
            11 { Get-WmiObject -Class Win32_OperatingSystem | Select-Object -Property TotalVisibleMemorySize, FreePhysicalMemory }
            12 { Select-String -Path "log_evt.log" -Pattern "machine" }
            13 { return }
            default { 
                Write-Host "Choix invalide."
                Start-Sleep -Seconds 1
            }
        }
        Read-Host "Appuyez sur Entrée pour continuer..."
    }
}

# Sous-menu utilisateurs
function Menu-Utilisateurs {
    while ($true) {
        Clear-Host
        Lashi
        Write-Host "Actions Utilisateur"
        Write-Host " "
        Write-Host "1. Création d'un compte local"
        Write-Host "2. Changer le mot de passe d'un compte"
        Write-Host "3. Suppression d'un compte utilisateur"
        Write-Host "4. Désactivation d'un compte utilisateur"
        Write-Host "5. Ajout à un groupe d'administration"
        Write-Host "6. Ajout à un groupe local"
        Write-Host "7. Retrait d'un groupe local"
        Write-Host "8. Retour au menu précédent"
        Write-Host " "
        $choix_action_utilisateur = Read-Host -Prompt "Choisissez une option"

        switch ($choix_action_utilisateur) {
            1 {
                $utilisateur = Read-Host -Prompt "Nom d'utilisateur"
                New-LocalUser -Name $utilisateur
            }
            2 {
                $utilisateur = Read-Host -Prompt "Nom d'utilisateur"
                $password = Read-Host -Prompt "Nouveau mot de passe" -AsSecureString
                Set-LocalUser -Name $utilisateur -Password $password
            }
            3 {
                $utilisateur = Read-Host -Prompt "Nom d'utilisateur"
                Remove-LocalUser -Name $utilisateur
            }
            4 {
                $utilisateur = Read-Host -Prompt "Nom d'utilisateur"
                Disable-LocalUser -Name $utilisateur
            }
            5 {
                $utilisateur = Read-Host -Prompt "Nom d'utilisateur"
                Add-LocalGroupMember -Group "Administrators" -Member $utilisateur
            }
            6 {
                $utilisateur = Read-Host -Prompt "Nom d'utilisateur"
                $groupe = Read-Host -Prompt "Groupe"
                Add-LocalGroupMember -Group $groupe -Member $utilisateur
            }
            7 {
                $utilisateur = Read-Host -Prompt "Nom d'utilisateur"
                $groupe = Read-Host -Prompt "Groupe"
                Remove-LocalGroupMember -Group $groupe -Member $utilisateur
            }
            8 { return }
            default {
                Write-Host "Choix invalide."
                Start-Sleep -Seconds 1
            }
        }
    }
}
# sous menu information utilisateur
function menu-informations-utilisateur {
    while ($true) {
        Clear-Host
        Lashi
        Write-Host "Informations Utilisateur"
        Write-Host " "
        Write-Host "1. Date de dernière connexion"
        Write-Host "2. Date de la dernière modification du mot de passe"
        Write-Host "3. Liste des sessions ouvertes par l'utilisateur"
        Write-Host "4. Groupes de l'utilisateur"
        Write-Host "5. Liste des commandes utilisées par l'utilisateur"
        Write-Host "6. Droit et permissions de l'utilisateur sur un dossier"
        Write-Host "7. Droit et permissions de l'utilisateur sur un fichier"
        Write-Host "8. Recherche dans log_evt.log pour un utilisateur"
        Write-Host "9. Retour au menu précédent"
        Write-Host " "
        #$utilisateur = Read-Host "Veuillez entrez le nom d'utilisateur:"
        $choix_info_utilisateur = Read-Host "Choisissez une option"

        switch ($choix_info_utilisateur) {
            1 { Get-LocalUser -Name $utilisateur | Select-Object -ExpandProperty LastLogon }
            2 { (Get-LocalUser -Name $utilisateur).PasswordLastSet }
            3 { query user $utilisateur }
            4 { Get-LocalGroup -Member $utilisateur }
            5 { Get-History | Where-Object {$_.CommandLine -like "*$utilisateur*"} }
            6 { 
                $dossier = Read-Host "Chemin du dossier"
                Get-Acl -Path $dossier | Format-List
            }
            7 { 
                $fichier = Read-Host "Chemin du fichier"
                Get-Acl -Path $fichier | Format-List
            }
            8 { 
                $logPath = "log_evt.log"
                Select-String -Path $logPath -Pattern $utilisateur
            }
            9 { return }
            default { 
                Write-Host "Choix invalide."
                Start-Sleep -Seconds 1
            }
        }
        Read-Host "Appuyez sur Entrée pour continuer..."
    }
}

# Fonction principale
function Main {
    while ($true) {
        Clear-Host
        Lashi
        Write-Host "Menu principal"
        Write-Host " "
        Write-Host "1 - Menu utilisateurs"
        Write-Host "2 - Menu machines"
        Write-Host "3 - Menu informations Utilisateur"
        Write-Host "4 - Menu informations Machines"
        Write-Host "5 - Quitter"
        Write-Host " "
        $choix = Read-Host -Prompt "Choisissez une option"

        switch ($choix) {
            1 { Menu-Utilisateurs }
            2 { Menu-Machines }
            3 { menu-informations-utilisateur }
            4 { menu-Informations-machines }
            5 {
                Write-Host "See you !"
                Exit
            }
            default {
                Write-Host "Option invalide, choix de 1 à 5"
                Start-Sleep -Seconds 3
            }
        }
    }
}
#Lancer le menu princiapl
main
