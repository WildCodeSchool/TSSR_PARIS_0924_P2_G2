#!/bin/bash



function redemarrer_client() {
    $logs début redémarrage de l'ordinateur client

    $sshtarget "sudo shutdown -r now"

    # Vérification si le redémarrage de l'ordinateur client a réussi
    if [ $? -eq 0 ]; then
        echo "L'ordinateur client a été redémarré avec succès."
        $logs L'ordinateur client a été redémarré avec succès.
    else
        echo "Échec du redémarrage de l'ordinateur client."
        $logs Échec du redémarrage de l'ordinateur client.
    fi

    $logs Fin redémarrage de l'ordinateur client
}
