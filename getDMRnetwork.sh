#!/bin/bash
############################################################
#  Get DMR Network from /etc/mmdvmhost                     #
#                                                          #
#                                                          #
#                                                          #
#                                                          #
#  KF6S                                        10-21-2020  #
############################################################
set -o errexit
set -o pipefail

#sudo cat /etc/mmdvmhost | grep "\[DMR Network\]" -A 7 | grep "Address=" | cut -b 9-59
m1=$(sudo grep -v ^\# /etc/mmdvmhost | grep "\[DMR Network\]" -A 7 | grep "Address=" | cut -b 9-59)
if [ "$m1" == "127.0.0.1" ]; then
  	m1="DMRGateway"
  	f1=$(sudo ls -x /var/log/pi-star/DMRGateway* | tail -n1)
  	NetNum=$(sudo tail -n1 "$f1" | cut -d " " -f 6)
	result="$m1 Net $NetNum"
fi

if [ "$m1" == "127.0.0.2" ]; then
  	result="DMR2YSF"
fi

if [ "$m1" == "127.0.0.3" ]; then
  	result="DMR2NXDN"
fi
echo "$result"
