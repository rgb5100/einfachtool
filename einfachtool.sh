#! /bin/bash

version=1.2
tool=0

cd /.skripte/
echo "Einfachtool Version $version"
echo "1) Abbrechen  2) CLI-Messenger  3) Git  4) Passwort-Tools"
read -p "Wähle das Tool: " tool
if [ $tool = 1 ]; then
echo "Einfachtool wird Beendet"
exit
fi
if [ $tool = 2 ]; then
echo "CLI-Messenger wurde ausgewählt"
bash cli-messenger.sh
fi
if [ $tool = 3 ]; then
echo "Git Tool wurde ausgewählt"
bash git.sh
fi
if [ $tool = 4 ]; then
echo "Passwort Tool wurde ausgewäht"
bash passwd.sh
fi
