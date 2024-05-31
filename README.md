# Bash skriptid

See repo sisaldab erinevaid Bash-skripte, nagu näiteks kasutajate lisamine (parooliga), andmete varundamine, failide kopeerimine, jne.
Skriptide käivitamiseks on vaja kasutada käsku `bash` ja skripti nime. Näiteks: `bash skript.sh` või `./skript.sh` (kui on antud õigused).
Skriptid on mõeldud kasutamiseks Linuxi keskkonnas.

## [Praks 1](/praks1/)

### [Ülessane 1](/praks1/lisa_kasutaja.sh)

Kasutaja lisamine. Skript küsib kasutajalt kasutajanime ning lisab selle kasutaja süsteemi.

### [Ülessane 2](/praks1/kasutajad_failist.sh)

Kasutajate lisamine failist. Skript loeb failist kasutajad ning lisab nad süsteemi.

### [Ülessane 3](praks1/kasutajad_paroolid.sh)

Kasutajate lisamine failist parooliga (`kasutaja1:parool1`). Skript loeb failist kasutajad parooliga ning lisab nad süsteemi. Kasutajatele määratakse ka parool.

### [Ülessane 4](praks1/kasutajad_ul4.sh)

Kasutajate lisamine eraldi failidest (Kasutajad ja parooli failid on eraldi). Skript loeb kasutajad ja paroolid eraldi failidest ning lisab kasutajad süsteemi.

### [Ülessane 5](praks1/loodud_kasutajad_paroolidega.sh)

Kasutajate lisamine failist kasutajate nimedega. Paroolid genereeritakse automaatselt. Skript loeb failist kasutajad ning lisab nad süsteemi. Kasutajatele määratakse automaatselt genereeritud paroolid.

### [Ülessane 6](praks1/loodud_kasutajad_paroolidega_oigustega.sh)

Kasutajate lisamine failist kasutajate nimedega. Paroolid genereeritakse automaatselt. Skript loeb failist kasutajad ning lisab nad süsteemi. Kasutajatele määratakse automaatselt genereeritud paroolid.
**Skript kontrollib, kas skripti käivitaja on root kasutaja. Kui ei ole, siis skript lõpetab töö.**

## [Praks 2](/praks2/)

### [Apache paigaldus](praks2/apache_paigaldus.sh)

Apache2 paigaldamine. Skript kontrollib, kas Apache2 on juba paigaldatud. Kui ei ole, siis paigaldab Apache2 linuxi masinasse ja käivitab selle.

## Andmete varundamine

### [Andmete varundamine](praks2/varundamine.sh)

Andmete varundamine. Skript salvestab kasutaja poolt sisestatud kausta andmed tar.gz faili. Skript küsib kasutajalt kausta nime, mida soovitakse varundada ja kausta nime, kuhu soovitakse varundatud faili salvestada.
