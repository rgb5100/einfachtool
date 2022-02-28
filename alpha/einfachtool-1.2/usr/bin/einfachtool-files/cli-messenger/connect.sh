#! /bin/bash
otherip=
ping -c 5 localhost -p 2121
ping -c 5 $otherip -p 2121
