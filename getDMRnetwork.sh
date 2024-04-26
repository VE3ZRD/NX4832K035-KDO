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
 # NetType=$(sudo tail -n1 "$f1" | cut -d " " -f 4)
  NetNum=$(sudo tail -n1 "$f1" | cut -d " " -f 6)
 # NName=$(sudo sed -nr "/^\[DMR Network "${NetNum##*( )}"\]/ { :l /^Name[ ]*=/ { s/.*=[ ]*//; p; >
 # NName=$(echo "$NName" | cut -d "_" -f1 |  tr '[:lower:]' '[:upper:]')
#                       NName=$(echo "$NName" |  tr '[:lower:]' '[:upper:]')
                        result=$(echo "DMR|$NName|GW:${NetNum##*( )}")

fi
echo "$m1 Net $NetNum"
