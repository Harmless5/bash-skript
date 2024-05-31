#!/bin/bash

# Skript loob uue kasutaja süsteemi

if [ $# -ne 1 ]; then
    echo "Kasutusjuhend: $0 kasutajanimi"
else
    kasutajanimi=$1
    # Lisame uue kasutaja süsteemi, kasutades useradd käsku
    useradd $kasutajanimi -m -s /bin/bash
    kasu_tulemus=$?
    if [ $kasu_tulemus -eq 0 ]; then
        echo "Kasutaja nimega $kasutajanimi on lisatud süsteemi"
        # Kuvame kasutaja andmed /etc/passwd failist
        cat /etc/passwd | grep $kasutajanimi
        # Kuvame kasutaja kodukataloogi sisu
        ls -la /home/$kasutajanimi
    else
        echo "probleem kasutaja $kasutajanimi lisamisega"
        echo "probleemi kood on $kasu_tulemus"
    fi
fi

# if [ $# -ne 1 ]; then
#     echo "Kasutusjuhend: $0 kasutajanimi"
#     exit 1
# fi

# kasutajanimi=$1

# # Lisame uue kasutaja süsteemi, kasutades useradd käsku
# if useradd $kasutajanimi -m -s /bin/bash; then
#     echo "Kasutaja nimega $kasutajanimi on lisatud süsteemi"
#     # Kuvame kasutaja andmed /etc/passwd failist
#     grep $kasutajanimi /etc/passwd
#     # Kuvame kasutaja kodukataloogi sisu
#     ls -la /home/$kasutajanimi
# else
#     echo "Probleem kasutaja $kasutajanimi lisamisega"
#     exit 1
# fi