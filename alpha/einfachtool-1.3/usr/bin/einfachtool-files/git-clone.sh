#! /bin/bash

cd ~
read -p "Gebe die zu Klone URL ein: " url
read -p "Gebe Den Pfad wo es geklont werden soll an: " dir
mkdir --parents  $dir
git clone $url $dir
echo "1) Benenden  2) Zurück  3) Zum Anfang"
read -p "Wähle das Tool: " tool
if [ $tool = 1 ]; then
exit
fi
if [ $tool = 2 ]; then
cd /.skripte/
bash git.sh
fi
if [ $tool = 3 ]; then
einfachtool
fi
