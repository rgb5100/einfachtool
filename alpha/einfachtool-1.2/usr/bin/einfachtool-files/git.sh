#! /bin/bash
echo "1) Abbrechen  2) Clone"
read -p "Welches Git Tool wilst du starten? " tool
if [ $tool = 1 ]; then
exit
fi
if [ $tool = 2 ]; then
bash git-clone.sh
fi
