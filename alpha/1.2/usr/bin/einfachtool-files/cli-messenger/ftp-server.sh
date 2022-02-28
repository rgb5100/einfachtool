#! /bin/bash
screen -S cli-messenger-ftpserver
python3 -m pyftpdlib -p 2121 -d /tmp/cli-messenger/ftp/
