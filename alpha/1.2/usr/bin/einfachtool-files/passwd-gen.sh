#! /bin/bash
version=1.0
pwtmp=/tmp/pwgen.tmp
echo "Passwort Generator $version"
echo "1) Gooß klein Zahlen und sonder zeichen  2) Gorß klein  3)"
read -p "Wähle den Sicherheits-Modus: " scmode
read -p "Wähle die Länge des Passwortes: " lcmode
if [ $scmode = 1 ]; then
passwd=`pwgen -ny $lcmode`
echo $passwd
echo "Passwot wurde generirt"
fi
read -p "Passwort in $pwtmp schreiben ?(j/n) " wirte
if [ $wirte = j ]; then
echo $passwd > $pwtmp
fi
read -p "Weiteres Passwort generiren?(j/n) " newpasswd
if [ $newpasswd = j ]; then
bash passwd-gen.sh
else
exit
fi
