#! /bin/bash#
echo "1) Abbrechen  2) Passwort-generiren  3) Passwort-Leak-check (offline)"
read -p "Welches Passwort Tool möchtes du starten ?: " tool
if [ $tool = 1 ]; then
exit
fi
if [ $tool = 2 ]; then
./usr/bin/einfachtool-files/passwd-gen.sh
fi
if [ $tool = 3 ]; then
./usrf/bin/einfachtool-files/passwd-leak-check.sh
fi
