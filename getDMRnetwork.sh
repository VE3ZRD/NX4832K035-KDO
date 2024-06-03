#!/bin/bash
############################################################
#  Get DMR Network from /etc/mmdvmhost                     #
#                                                          #
#                                                          #
#                                                          #
#                                                          #
#  KF6S/VE3RD                               2024-06-03     #
############################################################
set -o errexit
set -o pipefail
reboot="0"
#sudo cat /etc/mmdvmhost | grep "\[DMR Network\]" -A 7 | grep "Address=" | cut -b 9-59
##m1=$(sudo grep -v ^\# /etc/mmdvmhost | grep "\[DMR Network\]" -A 7 | grep "Address=" | cut -b 9-59)
m1=$(sudo sed -n '/^[ \t]*\[DMR Network\]/,/\[/s/^[ \t]*Address[ \t]*=[ \t]*//p' /etc/mmdvmhost)



if [ "$m1" == "127.0.0.1" ]; then
  	m2="DMRGateway"
  	f1=$(sudo ls -x /var/log/pi-star/DMRGateway* | tail -n1)
  	NetNum=$(sudo tail -n1 "$f1" | cut -d " " -f 6)
	LIST="123456"
	if echo "$LIST" | grep -q "$NetNum"; then
		result="$m2 Net $NetNum"
	else
		reboot="1"
	fi	
fi

if [ "$m1" == "127.0.0.2" ]; then
  	result="DMR2YSF"
fi

if [ "$m1" == "127.0.0.3" ]; then
  	result="DMR2NXDN"
fi

if [ "$reboot" == "1" ]; then
 result="Reboot DMRGateway"
else
echo "$result"
fi
