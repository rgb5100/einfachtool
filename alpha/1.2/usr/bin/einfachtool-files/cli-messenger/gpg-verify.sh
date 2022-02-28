#! /bin/bash

file=/tmp/cli-messenger/ftpd/messege.gpg
gpg=`gpg --verify $file`
grep $gpg Korrekte 
