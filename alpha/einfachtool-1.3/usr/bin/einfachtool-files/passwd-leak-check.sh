#!/bin/bash
version=1.0
lst=passwd.lst
tmp=/tmp/passwd.check
echo "Passwort Checker $version"
read -p "Möchtes du die Passwort Liste Aktualisiren?(j/n) " update
if [ $update = j ]; then
echo "Gehe auf https://haveibeenpwned.com/Passwords und lade dir die Datei "SHA-1 ordered by hash" herunter."
echo "Exthahire das Achriv, und speichere die enthaltene Datei in passwd.lst im Skript Ordner."
fi
read -p "Gebe dein zu checkendes Passwort ein: " passwd
echo Du möchtes $passwd prüfen
echo $passwd > $tmp
sha1sum $tmp > $tmp
passwd=`cat $tmp/passwd.check`
echo "Passwort Liste wird geladen"
echo "Passwort Liste wurde geladen"
echo "Passwort wird gesucht"
search for $passwd in passwd.lst

