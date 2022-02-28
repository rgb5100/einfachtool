#!/bin/bash
file=einfachtool.deb
1_input () {
echo "1) Installiren  2) Updaten  3) Entfernen"
read -p "Wähle die gewünschte Aktion: " action
if [ $action = 1 ]; then
install_deb
fi
if [ $action = 2 ]; then
remove_deb
install_deb
fi
if [ $action = 3 ]; then
remove_deb
fi
}
url () {
if 
url=https://raw.githubusercontent.com/rgb5100/einfachtool/main/stable/$version_deb-file m,
fi
if 
url=https://raw.githubusercontent.com/rgb5100/einfachtool/main/beta/$version_deb-file
fi
if 
url=https://raw.githubusercontent.com/rgb5100/einfachtool/main/alpha/$version_deb-file
fi
}
remove_deb () {
sudo apt remove einfachtool -y
}
install_deb () {
echo "1) Stable  2) Beta  3) Alpha"
read -p "Bitte wähle einen Typ von einfachtool: " type
read -p "Bitte wähle eine Version von 1.2 bis 1.3 oder new für die neuste Version: " version
if [ $type = 1 ]; then
curl -o cache https://raw.githubusercontent.com/rgb5100/einfachtool/main/stable/versions
cache=`cat cache`
$cache
fi
if [ $type = 2 ]; then
curl -o cache https://raw.githubusercontent.com/rgb5100/einfachtool/main/beta/versions
cache=`cat cache`
$cache
fi
if [ $type = 3 ]; then
curl -o cache https://raw.githubusercontent.com/rgb5100/einfachtool/main/alpha/versions
cache=`cat cache`
$cache
fi
if [ $version = new ]; then
version=1.3
fi
url
sudo curl -o $file $version_url
sudo dpkg -i $file
sudo rm -R $file
echo "-------------------------------------"
echo Einfachtool $version wurde installiert.
echo "Du kanst es nun ausführen."
echo "-------------------------------------"
read -p "Soll nun einfachtool ausgefürt werden?[Y/n] " run
if [ $run = y ]; then
einfachtool
fi
if [ $run = Y ]; then
einfachtool
fi
if [ $run = j ]; then
einfachtool
fi
if [ $run = J ]; then
einfachtool
fi
}
1_input
exit
