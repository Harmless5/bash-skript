#!/bin/bash

if [ $# -ne 1 ]; then
    echo "Kasutusjuhend: $0 failinimi"
else
    failinimi=$1
    # Kontrollib, kas antud fail on olemas ja loetav
    if [ -f $failinimi -a -r $failinimi ]; then
        echo "fail on korras"
        # Loeb failist kasutajanimed ja käivitab lisa_kasutaja skripti iga kasutajanime jaoks
        for nimi in $(cat $failinimi)
        do
            sh lisa_kasutaja $nimi
        done
    else
        echo "probleem failiga $failinimi"
    fi
fi