#!/bin/sh
echo $'\e[1;31m'"·▄▄▄▪  .▄▄ ·  ▄ .▄.▄▄ ·  ▄▄· ▄▄▄  ▪   ▄▄▄·▄▄▄▄▄
▐▄▄·██ ▐█ ▀. ██▪▐█▐█ ▀. ▐█ ▌▪▀▄ █·██ ▐█ ▄█•██  
██▪ ▐█·▄▀▀▀█▄██▀▐█▄▀▀▀█▄██ ▄▄▐▀▀▄ ▐█· ██▀· ▐█.▪
██▌.▐█▌▐█▄▪▐███▌▐▀▐█▄▪▐█▐███▌▐█•█▌▐█▌▐█▪·• ▐█▌·
▀▀▀ ▀▀▀ ▀▀▀▀ ▀▀▀ · ▀▀▀▀ ·▀▀▀ .▀  ▀▀▀▀.▀    ▀▀▀    v0.01"
echo "scans local wifi devices and prints information
"
read -n 1 -r -s -p $'press any key to continue... \n'
echo $'\e[0;49;96m'"scanning..."
echo $'\e[0;49;39m'
nmap -sn 192.168.1.0/24
echo $'\e[0;49;96m'
echo "scan which IP?"
echo $'\e[0;49;39m'
read coolIP
echo $'\e[0;49;96m'"you typed $coolIP. is this correct?"
echo $'\e[0;49;39m'
read answer
case ${answer:0:1} in
    y|Y )
        sudo nmap -O -v $coolIP
    ;;
    * )
        break
    ;;
esac
