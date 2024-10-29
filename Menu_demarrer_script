#!/bin/bash

# Fonction pour arrêter un ordinateur client
function arreter_client() {
    # Adresse IP ou nom d'hôte de l'ordinateur client
    client_address="adresse_ip_ou_nom_hote"

    # Nom d'utilisateur sur l'ordinateur client
    username="utilisateur"

    # Utilisation de la commande ssh pour se connecter à l'ordinateur client et l'arrêter
    ssh "$ssh wilder@172.16.10.30" "sudo poweroff"
}

# Appel de la fonction pour arrêter l'ordinateur client
arreter_client
