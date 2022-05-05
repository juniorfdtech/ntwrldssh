#!/bin/bash

scor='\033[0m'
cor1='\033[1;37m'
cor2='\033[1;31m'
cor3='\033[1;32m'
cor4='\033[1;36m'
cor5='\033[1;34m'
cor6='\033[1;35m'
cortxt='\033[1;33m'
corbar1='\033[41;1;37m'
corbar2='\033[44;1;37m'

clear
echo -e "${corbar2}             LIBERAR FIREWALL           ${scor}"
echo ""
echo -e "${cor2}• ${cortxt}PORTAS A SER LIBERADAS${scor}"
echo -e "${cor2}• ${cortxt}TCP: 80,443,1194,7505,8088,8088,444,8799,8000${scor}"
echo -e "${cor2}• ${cortxt}UDP: 7300,7200,7100${scor}"
echo ""
read -p "Deseja Prosseguir? sim (y) nao (n): " yn
    if [[ "$yn" =~ 'y' ]]; then continue; fi
    if [[ "$yn" =~ 'n' ]]; then exit; fi

sudo apt-get update
 
sudo apt install firewalld 

sudo firewall-cmd --zone=public --permanent --add-port=1194/tcp

sudo firewall-cmd --zone=public --permanent --add-port=7505/tcp
 
sudo firewall-cmd --zone=public --permanent --add-port=80/tcp

sudo firewall-cmd --zone=public --permanent --add-port=443/tcp

sudo firewall-cmd --zone=public --permanent --add-port=8088/tcp

sudo firewall-cmd --zone=public --permanent --add-port=8000/tcp

sudo firewall-cmd --zone=public --permanent --add-port=8080/tcp

sudo firewall-cmd --zone=public --permanent --add-port=444/tcp

sudo firewall-cmd --zone=public --permanent --add-port=8799/tcp

sudo firewall-cmd --zone=public --permanent --add-port=7300/udp

sudo firewall-cmd --zone=public --permanent --add-port=7200/udp

sudo firewall-cmd --zone=public --permanent --add-port=7100/udp
 
sudo firewall-cmd --reload 
 
sudo firewall-cmd --zone=public --list-ports
