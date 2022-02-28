#! /bin/bash
tmp=/tmp/cli-messenger
file=`$tmp/build/hash.file`
sha512sum $file > $hash
echo $hash > $tmp/build/hash
rm -R $tmp/build/hash.file
exit
