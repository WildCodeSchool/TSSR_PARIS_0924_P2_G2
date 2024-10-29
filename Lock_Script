#!/bin/bash

logs="logger -t $0 $choix_user $choix_ordinateur"

function verrouiller_client() {
    $logs début verrouillage de l'ordinateur client

    $sshtarget "xlock"

    # Vérification si le verrouillage de l'ordinateur client a réussi
    if [ $? -eq 0 ]; then
        echo "L'ordinateur client a été verrouillé avec succès."
        $logs L'ordinateur client a été verrouillé avec succès.
    else
        echo "Échec du verrouillage de l'ordinateur client."
        $logs Échec du verrouillage de l'ordinateur client.
    fi

    $logs Fin verrouillage de l'ordinateur client
}
