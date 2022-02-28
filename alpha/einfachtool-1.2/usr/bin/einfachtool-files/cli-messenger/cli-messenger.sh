#! /bin/bash
variabelen () {
bash cli-messenger/init.sh >/dev/null 2>&1 &
testing=0
warn=0
run=1
init=1
tested=0
connetcet=1
testmessage=0
sigtested=0
stop=0
down=0
error=0
startdate=`date +%m.%d.%y`
date=`date +%m.%d.%y`
starttime=`date +%H:%M:%S`
time=`date +%H:%M:%S`
tmpfile="/tmp/cli-messenger.tmp"
tmpdir=/tmp/cli-messenger/
logfile=~/log/cli-messenger-$startdate-$starttime.log
random=$RANDOM
localhost=127.0.0.1
message=message
otherhost=otherhost
curentdir=`pwd`
homedir=~
myip=`hostname -I`
ftpuser=anonymus
ftppass=""
user=USER
otheruser=Benutzer
ftpdir=/tmp/cli-messenger/ftp
settingsdir=~/.config/cli-messenger/
mainpid=`pgrep einfachtool`
groundpid=
}
background () {
	tmpdir=/tmp/cli-messenger
key=`cat $tmpdir/key`
key-sig=`cat $tmpdir/key-sig`
}
connect () {
	ping -c 5 localhost -p 2121
ping -c 5 $otherip -p 2121
}
ftpserver () {
	screen -S cli-messenger-ftpserver
python3 -m pyftpdlib -p 2121 -d /tmp/cli-messenger/ftp/
}
gpg-verify () {
	file=/tmp/cli-messenger/ftpd/messege.gpg
gpg=`gpg --verify $file`
grep $gpg Korrekte 
}
gpg-signirung () {
	file=/tmp/cli-messenger/ftp/username
key=`cat /tmp/cli-messenger/key-sig`
sha512sum $file > $hash
gpg --encrypt --recipient $key $hash /tmp/cli-messenger/messaga.sig
}
message-build () {
	dir=`cat ~/.config/cli-messenger/skriptdir`
dird=`cat ~/.config/cli-messenger/message-bulid-dir`
cd $dird
mkdir build/
cp $dir $dird
cd $dir
bash message-check.sh
bash hash.sh
bash gpg-signirung.sh
bash gpg-encrypt.sh
bash message-zip.sh
bash message-copy.sh
rm -R 
}
message-hash () {
	tmp=/tmp/cli-messenger
file=`$tmp/build/hash.file`
sha512sum $file > $hash
echo $hash > $tmp/build/hash
rm -R $tmp/build/hash.file
exit
}
message-send () {
	bash message-check.sh
if [ $txt = 1]; then
bash message-hash.sh
bash message-build.sh
bash message-signirung.sh
bash message-zip.sh
bash gpg-encrypt.sh
fi
if [ $txt = 0 ]; then
bash message-send-file.sh
bash message-hash.sh
fi
exit
}
message () {
	bash cli-messenger/message-build.sh >/dev/null 2>&1 &
}
stop () {
	rm -R /tmp/cli-messenger/*
rm -R /tmp/cli-messenger*
}
vodergrund () {
if [ $testing = 1 ]; then
echo ---- Info ----
echo ---- Variabeln ----
echo $testing
echo $run
echo $startdate
echo $starttime
echo $tmpfile
echo $random
echo $localhost
echo $message
echo $otherhost
echo $curentdir
echo $homedir
echo $init
echo $tested
echo $connetcet
echo $testmessage
echo $sigtested
echo $stop
echo $down
echo $myip
echo $ftpuser
echo $ftppass
echo $user
echo $otheruser
echo $sercretencryptkey
echo $secetsignirunskey
echo $ftpdir
echo $error
echo $logfile
echo $mainpid
echo $groundpid
echo ---- Variabeln ----
echo ---- Info ----
#else
#echo "Entwiklermodus ist deaktivirt"
fi
#exit+
rm -R /tmp/cli-messenger
mkdir --parents /tmp/cli-messenger
mkdir --parents /tmp/cli-messenger/ftp
if [ $warn = 1 ]; then
echo "Es ist wichtig, das du das Skript aus dem Pfad startest wo du es auch ausführst. Es kann sonst zu Fehlern kommen."
fi
echo "PGP Messenger Startet"
echo "Vorbereitung läuft"
echo "Vorbereitung ist abgeschlossen"
if [[ $(ip -4 addr | grep inet | grep -vEc '127(\.[0-9]{1,3}){3}') -eq 1 ]]; then
		ip=$(ip -4 addr | grep inet | grep -vE '127(\.[0-9]{1,3}){3}' | cut -d '/' -f 1 | grep -oE '[0-9]{1,3}(\.[0-9]{1,3}){3}')
	else
		number_of_ip=$(ip -4 addr | grep inet | grep -vEc '127(\.[0-9]{1,3}){3}')
		echo
		echo "Which IPv4 address should be used?"
		ip -4 addr | grep inet | grep -vE '127(\.[0-9]{1,3}){3}' | cut -d '/' -f 1 | grep -oE '[0-9]{1,3}(\.[0-9]{1,3}){3}' | nl -s ') '
		read -p "IPv4 address [1]: " ip_number
		until [[ -z "$ip_number" || "$ip_number" =~ ^[0-9]+$ && "$ip_number" -le "$number_of_ip" ]]; do
			echo "$ip_number: invalid selection."
			read -p "IPv4 address [1]: " ip_number
		done
		[[ -z "$ip_number" ]] && ip_number="1"
		ip=$(ip -4 addr | grep inet | grep -vE '127(\.[0-9]{1,3}){3}' | cut -d '/' -f 1 | grep -oE '[0-9]{1,3}(\.[0-9]{1,3}){3}' | sed -n "$ip_number"p)
fi
#Abfrage von Benutzer Daten
read -p "Zweiter Teilnemer IP: " ftpserveraddrese
echo Zweiter Teilnemer IP ist: $ftpserveraddrese
read -p "Wie willst du genant werden? Gebe deiinen Namen jetzt ein: " user
sercretencryptkey=CLI-Messenger-$user
echo $sercretencryptkey > /tmp/cli-messenger/key
secetsignirunskey=CLI-Messenger-$user-sig
echo $secetsignirunskey > /tmp/cli-messenger/key-sig
echo $user > /tmp/cli-messenger/ftp/username
gpg --export --armor $sercretencryptkey > /tmp/cli-messenger/ftp/$user.key
gpg --export --armor $secetsignirunskey > /tmp/cli-messenger/ftp/$user.sig
echo Du wirst jetzt $user genannt.
echo Hallo $user und herzlich willkommen zu meinem Messenger mit PGP Verschlüsselung
echo "Verbindung wird getestet, bitte warten."
bash cli-messenger/connect.sh >/dev/null 2>&1 &
if [ $connetcet = 1 ]; then
echo "Du bist jetzt Verbunden"
fi
while [ $connetcet = 1 ]
do
read -p "Nachricht an $otheruser: " message
echo Du hast "$message" eingegeben
echo $message  > /tmp/cli-messenger/raw.message
bash cli-messenger/message-send.sh >/dev/null 2>&1 &
done
while [ message = %stop% ]
if [ message = %stop% ]; then
read -p "Willst du dich wirklich Trennen ? [y/n] " stop
fi
done
# Wenn verbunden ist und Chat frei ist

if [ down = 1 ]; then
read -p "Willst du dich wirklich Trennen ? [y/n] " stop
fi
if [ stop = y ]; then
bash $curentdir/cli-messenger/stop.sh
exit
fi
}
variabelen
vodergrund