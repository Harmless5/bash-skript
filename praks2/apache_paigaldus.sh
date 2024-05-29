#!/bin/bash
# Skript, mis kontrollib, kas apache2 on installeeritud. Kui ei ole, siis installib selle.

# Teenuse nimi
$apache_teenus=$(dpkg-query -W -f='${Status}' apache2 2>/dev/null | grep -c "ok installed")

# Kontrollime, kas teenus on installeeritud
if [ $apache_teenus -eq 0 ]; then
    # Installime teenuse
    sudo apt install apache2
    # Näitame teenuse olekut
    sudo systemctl status $SERVICE_NAME
    echo "Apache on installeeritud"
elif [ $apache_teenus -eq 1 ]; then
    echo "Apache on juba installeeritud"
    systemctl status apache2
    systemctl start apache2
fi