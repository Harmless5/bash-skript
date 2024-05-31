#!/bin/bash

# Paroolide genereerimise ja kasutajate lisamise skript
# See skript võimaldab lisada kasutajaid süsteemi ning genereerida ja määrata neile paroole.
# Skripti käivitamiseks peab kasutaja olema root kasutaja.

if [ $# -ne 1 ]; then
    echo "Kasutusjuhend: $0 kasutajad"
else
    kasutajad=$1
    # Kontrollib, kas antud fail on olemas ja loetav
    if [ -f $kasutajad -a -r $kasutajad ]; then
        echo "failid on korras"
        # Loeb failist kasutajanimed ja käivitab lisa_kasutaja skripti iga kasutajanime jaoks
        for rida in $(paste -d: $kasutajad $paroolid)
        do
            kasutajanimi=$(echo "$rida")
            # Lisame uue kasutaja süsteemi
            sh lisa_kasutaja $kasutajanimi
            # Genereerime parooli
            parool=$(pwgen -s 8 1)
            # Lisame parooli kasutajale
            echo "$kasutajanimi:$parool" | chpasswd
            echo "$kasutajanimi - $parool" >> Kasutajad loodud paroolidega
        done
    else
        echo "probleem failiga $kasutajad"
    fi
fi