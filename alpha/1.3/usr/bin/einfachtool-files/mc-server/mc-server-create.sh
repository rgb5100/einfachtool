#! /bin/bash

#version=
#mc-version=1.18.1
#mc-version=1.18
#paper-version-1.18.1="https://papermc.io/api/v2/projects/paper/versions/1.18.1/builds/103/downloads/paper-1.18.1-103.jar paper-1.18.1-103.jar"

#tee /tmp/einfachtool/mc-server-create/eingaben.txt
read -p "Gebe die gewünschte Version ein: " version
echo  Folgende Version wurde gewählt: $version >> /tmp/Einfachtool/mc-server-create/input.txt
read -p "Gebe den gewünschten Typ ein: " typ
echo  Folgender Typ wurde gewählt: $typ

liste=$(apropos $version)
listel=$(apropos $typ)
#echo "      Player-Liste:"
#echo "$liste"
