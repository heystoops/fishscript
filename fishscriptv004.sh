#!/bin/sh
echo $'\e[1;31m'"
·▄▄▄▪  .▄▄ ·  ▄ .▄.▄▄ ·  ▄▄· ▄▄▄  ▪   ▄▄▄·▄▄▄▄▄
▐▄▄·██ ▐█ ▀. ██▪▐█▐█ ▀. ▐█ ▌▪▀▄ █·██ ▐█ ▄█•██  
██▪ ▐█·▄▀▀▀█▄██▀▐█▄▀▀▀█▄██ ▄▄▐▀▀▄ ▐█· ██▀· ▐█.▪
██▌.▐█▌▐█▄▪▐███▌▐▀▐█▄▪▐█▐███▌▐█•█▌▐█▌▐█▪·• ▐█▌·
▀▀▀ ▀▀▀ ▀▀▀▀ ▀▀▀ · ▀▀▀▀ ·▀▀▀ .▀  ▀▀▀▀.▀    ▀▀▀    v0.04"
echo "hello world!"
echo $'\e[0;49;39m'

options=("local devices & info" "port scanner" "exit")
width=25
cols=1

for ((i=0;i<${#options[@]};i++)); do 
  string="$(($i+1))) ${options[$i]}"
  printf "%s" "$string"
  printf "%$(($width-${#string}))s" " "
  [[ $(((i+1)%$cols)) -eq 0 ]] && echo
done

while true; do
  echo
  read -p '#? ' opt
  case $opt in

    1)
      echo "scanning gateway 192.168.1.254..."
      nmap -sn 192.168.1.0/24
      echo "scan which IP?"
      read mainIP
      sudo nmap -O -v $mainIP
    ;;

    2)
      echo "enter an IP to port scan:"
      read portIPscan
      sudo nmap -p 1-65535 -T4 $portIPscan
    ;;

    3)
      break
    ;;
  esac
done

