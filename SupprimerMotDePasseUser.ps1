# Fonction pour vérifier si l'utilisateur existe
function Check-UserExistence {
    param (
        [string]$username
    )
    
    # Vérifie si l'utilisateur existe
    try {
        $user = Get-LocalUser -Name $username -ErrorAction Stop
        return $true
    } catch {
        return $false
    }
}

# Boucle principale
while ($true) {
    # Demande le nom d'utilisateur
    $username = Read-Host "Entrez le nom d'utilisateur à vérifier (ou tapez 'exit' pour quitter)"

    # Permet à l'utilisateur de quitter
    if ($username -eq "exit") {
        Write-Host "Sortie du programme."
        break
    }

    # Vérifie si l'utilisateur existe
    if (Check-UserExistence -username $username) {
        Write-Host "L'utilisateur $username existe."

        # Demande si l'utilisateur souhaite changer le mot de passe
        $choix = Read-Host "Voulez-vous changer le mot de passe de $username ? (o/n)"
        
        # Validation de l'entrée
        if ($choix -eq "o" -or $choix -eq "O") {
            # Changement du mot de passe
            Write-Host "Vous allez maintenant changer le mot de passe de $username."
            $newPassword = Read-Host "Entrez le nouveau mot de passe" -AsSecureString
            Set-LocalUser -Name $username -Password $newPassword
            Write-Host "Mot de passe changé avec succès."
        }
        elseif ($choix -eq "n" -or $choix -eq "N") {
            Write-Host "Aucune modification effectuée."
        }
        else {
            Write-Host "Entrée invalide. Veuillez répondre par 'o' ou 'n'."
        }
    }
    else {
        Write-Host "L'utilisateur $username n'existe pas. Veuillez réessayer."
    }
}
