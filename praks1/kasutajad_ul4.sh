#!/bin/bash

# Kasutajate lisamise skript
if [ $# -ne 2 ]; then
    echo "Kasutusjuhend: $0 kasutajad failinimi"
else
    kasutajad=$1
    failinimi=$2
    # Kontrollib, kas antud fail on olemas ja loetav
    if [ -f $failinimi -a -r $failinimi ]; then
        echo "fail on korras"
        # Loeb failist kasutajanimed ja käivitab lisa_kasutaja skripti iga kasutajanime jaoks
        for nimi in $(cat $failinimi)
        do
            kasutajanimi=$(echo $nimi | cut -f1 -d":")
            parool=$(echo $nimi | cut -f2 -d":")
            if useradd $kasutajanimi -m -s /bin/bash; then
                echo "Kasutaja nimega $kasutajanimi on lisatud süsteemi"
                echo "$kasutajanimi:$parool" | chpasswd
                # Kuvame kasutaja andmed /etc/passwd failist
                grep $kasutajanimi /etc/passwd
                # Kuvame kasutaja kodukataloogi sisu
                ls -la /home/$kasutajanimi
            else
                echo "Probleem kasutaja $kasutajanimi lisamisega"
                exit 1
            fi
        done
    else
        echo "probleem failiga $failinimi"
    fi
fi