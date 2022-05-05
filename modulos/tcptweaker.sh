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

tput setaf 7 ; tput setab 4 ; tput bold ; printf '%35s%s%-20s\n' "TCP Tweaker 1.1" ; tput sgr0
if [[ `grep -c "^#PH56" /etc/sysctl.conf` -eq 1 ]]
then
	echo ""
	echo -e "${cortxt}As configurações de rede TCP Tweaker já foram adicionadas no sistema!${scor}"
	sleep 2
	echo ""
	read -p "(*) Deseja remover as configurações do TCP Tweaker? [s/n]: " -e -i n resposta0
	if [[ "$resposta0" = 's' ]]; then
		grep -v "^#PH56
net.ipv4.tcp_window_scaling = 1
net.core.rmem_max = 16777216
net.core.wmem_max = 16777216
net.ipv4.tcp_rmem = 4096 87380 16777216
net.ipv4.tcp_wmem = 4096 16384 16777216
net.ipv4.tcp_low_latency = 1
net.ipv4.tcp_slow_start_after_idle = 0" /etc/sysctl.conf > /tmp/syscl && mv /tmp/syscl /etc/sysctl.conf
sysctl -p /etc/sysctl.conf > /dev/null
		echo ""
		echo -e "${cortxt}As configurações de rede do TCP Tweaker foram removidas com sucesso.${scor}"
		sleep 3
		clear
		menu
		echo ""
	exit
	else 
		echo ""
		exit
	fi
else

    echo ""
	echo ""
	echo -e "${cor2}• ${cortxt}Este é um script experimental. Use por sua conta e risco!${scor}"
	echo -e "${cor2}• ${cortxt}Este script irá alterar algumas configurações de rede${scor}"
	echo -e "${cor2}• ${cortxt}Do sistema para reduzir a latência e melhorar a velocidade.${scor}"
	echo ""
	echo ""
	read -p  "(*) Deseja continua com a instalação? [s/n]:  " -e -i n resposta
	if [[ "$resposta" = 's' ]]; then
	echo ""
	echo -e "${cor2}• ${cortxt}Modificando as seguintes configurações:${scor}"
	sleep 3
	echo " " >> /etc/sysctl.conf
	echo "#PH56" >> /etc/sysctl.conf
echo "net.ipv4.tcp_window_scaling = 1
net.core.rmem_max = 16777216
net.core.wmem_max = 16777216
net.ipv4.tcp_rmem = 4096 87380 16777216
net.ipv4.tcp_wmem = 4096 16384 16777216
net.ipv4.tcp_low_latency = 1
net.ipv4.tcp_slow_start_after_idle = 0" >> /etc/sysctl.conf
echo ""
sysctl -p /etc/sysctl.conf
		echo ""
		echo -e "${cortxt}As configurações de rede do TCP Tweaker foram adicionadas com sucesso.${scor}"
		sleep 3
		echo ""
	else
		echo ""
		echo -e "${cortxt}A instalação foi cancelada pelo usuário!${scor}"
		sleep 3
		echo ""
	fi
fi
exit
