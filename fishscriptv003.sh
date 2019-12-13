#!/bin/sh
echo $'\e[1;31m'"·▄▄▄▪  .▄▄ ·  ▄ .▄.▄▄ ·  ▄▄· ▄▄▄  ▪   ▄▄▄·▄▄▄▄▄
▐▄▄·██ ▐█ ▀. ██▪▐█▐█ ▀. ▐█ ▌▪▀▄ █·██ ▐█ ▄█•██  
██▪ ▐█·▄▀▀▀█▄██▀▐█▄▀▀▀█▄██ ▄▄▐▀▀▄ ▐█· ██▀· ▐█.▪
██▌.▐█▌▐█▄▪▐███▌▐▀▐█▄▪▐█▐███▌▐█•█▌▐█▌▐█▪·• ▐█▌·
▀▀▀ ▀▀▀ ▀▀▀▀ ▀▀▀ · ▀▀▀▀ ·▀▀▀ .▀  ▀▀▀▀.▀    ▀▀▀    v0.03"
echo "hello world!
"


options=("local devices & info" "port scanner" "ssh" "exit")
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
      echo $'\e[0;49;96m'"enter an IP to port scan:"
      echo $'\e[0;49;39m'
      read portIPscan
      sudo nmap -p 1-65535 -T4 $portIPscan
    ;;

   3 )
     echo "this section is a rudimentary work in progress"
     echo "run '~,' after an SSH session to end the connection"
     echo "remember to use a VPN and change your MAC regularly, kids"
     echo "enter the IP you want to ssh into:"
     read sshIP
     echo "enter the username of the machine you are connecting to:"
     read sshUser
     ssh $sshUser@$sshIP
    ;;

    4 )
      break
    ;;
  esac
done
