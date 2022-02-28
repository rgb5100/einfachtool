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
remove_deb () {
sudo apt remove einfachtool -y
}
install_deb () {
echo "1) Stable  2) Beta  3) Alpha"
read -p "Bitte wähle einen Typ von einfachtool: " type
if [ $type = 1 ]; then
type=stable
curl -o cache-1 https://raw.githubusercontent.com/rgb5100/einfachtool/main/stable/versions-1
curl -o cache-2 https://raw.githubusercontent.com/rgb5100/einfachtool/main/stable/versions-2
versions_1=`cat cache-1`
versions_2=`cat cache-2`
rm -R cache-1
rm -R cache-2
fi
if [ $type = 2 ]; then
type=beta
curl -o cache https://raw.githubusercontent.com/rgb5100/einfachtool/main/beta/versions-1
curl -o cache https://raw.githubusercontent.com/rgb5100/einfachtool/main/beta/versions-2
versions_1=`cat cache-1`
versions_2=`cat cache-2`
rm -R cache-1
rm -R cache-2
fi
if [ $type = 3 ]; then
type=alpha
curl -o cache-1 https://raw.githubusercontent.com/rgb5100/einfachtool/main/alpha/versions-1
curl -o cache-2 https://raw.githubusercontent.com/rgb5100/einfachtool/main/alpha/versions-2
versions_1=`cat cache-1`
versions_2=`cat cache-2`
rm -R cache-1
rm -R cache-2
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
1_input
exit
