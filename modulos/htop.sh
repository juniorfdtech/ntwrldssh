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
echo -e "${corbar2}             HTOP           ${scor}"
echo ""
echo -e "${cor3}COM ESTA FERRAMENTA VOCE VERIFICA TODOS OS PROCESSOS DO SISTEMA${scor}"
echo -e "" 
echo -e "${cor2}ATENCÃO: ${cor5} A INSTALACAO PODE DEMORAR UNS SEGUNDOS${scor}"
echo -e "" 
apt-get install htop > /dev/null 2>&1
sleep 4s
echo -e "${cor2}PARA SAIR PRESSIONE CTLR+C ${scor}"
sleep 5s
echo -e "${cor5}════════════════════════════════════════════════${scor}"

htop