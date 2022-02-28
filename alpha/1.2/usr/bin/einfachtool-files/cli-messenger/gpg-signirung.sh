#! /bin/bash

file=/tmp/cli-messenger/ftp/username
key=`cat /tmp/cli-messenger/key-sig`
sha512sum $file > $hash
gpg --encrypt --recipient $key $hash /tmp/cli-messenger/messaga.sig
