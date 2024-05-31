#!/bin/bash

echo -n "Sisesta kaust, mida soovid backupida: "
read kaust
echo -n "Sisesta kausta nimi, kuhu soovid backupi salvestada: "
read backup

echo "Kaust $kaust backupitakse kausta $backup"
mkdir `echo $backup`
sleep 3
ls -ld `echo $backup`
sleep 3
echo "Praegune asukoht: `pwd`"
sleep 3
echo "Vahetan asukohta kausta $kaust"
cd $kaust

for filename in $(ls $kaust); do
    if [ -f $filename ]; then
        result = "$filename is a regular file"
        echo "$result "
    else
        if [ -d $filename ]; then
            result = "$filename is a directory"
            echo "$result "
            kuupaev=$(date +"%d-%m-%Y")
            echo $kuupaev
            echo "$kaust/$filename on backupitud kausta $backup"
            tar -czf $backup/$filename-$kuupaev.tar.gz $filename
            gzip -l $backup/$filename-$kuupaev.tar.gz
            mv $filename-$kuupaev.tar.gz $backup
            sleep 3
            echo "Backup on tehtud kausta $backup"
            ls -l `echo $kaust$filename.$kuupaev.tar.gz`
        else
            result = "$filename is not valid"
            echo "$result "
        fi
    fi
done