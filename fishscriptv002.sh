#!/bin/sh
echo $'\e[1;31m'"·▄▄▄▪  .▄▄ ·  ▄ .▄.▄▄ ·  ▄▄· ▄▄▄  ▪   ▄▄▄·▄▄▄▄▄
▐▄▄·██ ▐█ ▀. ██▪▐█▐█ ▀. ▐█ ▌▪▀▄ █·██ ▐█ ▄█•██  
██▪ ▐█·▄▀▀▀█▄██▀▐█▄▀▀▀█▄██ ▄▄▐▀▀▄ ▐█· ██▀· ▐█.▪
██▌.▐█▌▐█▄▪▐███▌▐▀▐█▄▪▐█▐███▌▐█•█▌▐█▌▐█▪·• ▐█▌·
▀▀▀ ▀▀▀ ▀▀▀▀ ▀▀▀ · ▀▀▀▀ ·▀▀▀ .▀  ▀▀▀▀.▀    ▀▀▀    v0.02"
echo "hello world!
"


options=("local devices & info" "exit")
width=25
cols=3

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
			## write separate scripts between each num's brackets

    1)
      echo $'\e[0;49;96m'"scanning gateway 192.168.1.254..."
      echo $'\e[0;49;39m'
      nmap -sn 192.168.1.0/24
      echo $'\e[0;49;96m'
      echo "scan which IP?"
      echo $'\e[0;49;39m'
      read coolIP
        sudo nmap -O -v $coolIP
    ;;


    2 )
       break
      ;;
  esac
done
