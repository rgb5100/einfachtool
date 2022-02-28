#!/bin/bash
file=einfachtool.deb
init () {
pwd=`pwd`
mkdir ~/.cache/installer-einfachtool
ch ~/.cache/installer-einfachtool
curl -o stable-1 https://raw.githubusercontent.com/rgb5100/einfachtool/main/stable/versions-1
curl -o stable-2 https://raw.githubusercontent.com/rgb5100/einfachtool/main/stable/versions-2
curl -o beta-1 https://raw.githubusercontent.com/rgb5100/einfachtool/main/beta/versions-1
curl -o beta-2 https://raw.githubusercontent.com/rgb5100/einfachtool/main/beta/versions-2
curl -o alpha-1 https://raw.githubusercontent.com/rgb5100/einfachtool/main/alpha/versions-1
curl -o alpha-2 https://raw.githubusercontent.com/rgb5100/einfachtool/main/alpha/versions-2
clear
}
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
remove_deb () {
sudo apt remove einfachtool -y
}
install_deb () {
echo "1) Stable  2) Beta  3) Alpha"
read -p "Bitte wähle einen Typ von einfachtool: " type
if [ $type = 1 ]; then
type=stable
versions_1=`cat stable-1`
versions_2=`cat stable-2`
fi
if [ $type = 2 ]; then
type=beta
versions_1=`cat beta-1`
versions_2=`cat beta-2`
fi
if [ $type = 3 ]; then
type=alpha
versions_1=`cat alpha-1`
versions_2=`cat alpha-2`
fi
read -p "Bitte wähle eine Version von $versions_1 bis $versions_2 oder new für die neuste Version: " version
if [ $version = new ]; then
version_url=https://raw.githubusercontent.com/rgb5100/einfachtool/main/$type/$versions_2
fi
if [ $type = stable ]; then
version_url=https://raw.githubusercontent.com/rgb5100/einfachtool/main/stable/$version
fi
if [ $type = beta ]; then
version_url=https://raw.githubusercontent.com/rgb5100/einfachtool/main/beta/$version
fi
if [ $type = alpha ]; then
version_url=https://raw.githubusercontent.com/rgb5100/einfachtool/main/alpha/$version
fi
sudo curl -o cache.deb $version_url
sudo chmod 700 cache.deb
sudo dpkg -i cache.deb
sudo rm -R cache.deb
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
end () {
rm -R ~/.cache/installer-einfachtool
cd $pwd
}
main () {
init
1_input
end
}
main
