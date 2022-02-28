#! /bin/bash
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