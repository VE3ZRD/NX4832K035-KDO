#!/bin/bash
############################################################
#  Change DMR Master in /etc/mmdvmhost, find old value and #
#  substitute with new value from Profie 2 screen passed   #
#  in $1.                                                  #
#                                                          #
#  KF6S                                        05-20-2019  #
############################################################
set -o errexit
set -o pipefail
# Use passed DMR Master if present or default to TGIF if missing
if [ -z "$1" ]; then
Address="tgif.network"
else
address=$(echo "$line" | cut -d "|" -f1)
fi
sudo mount -o remount,rw /

line="$1"
passwd=$(echo "$line" | cut -d "|" -f2)
port=$(echo "$line" | cut -d "|" -f3)

sed -i '/^\[/h;G;/DMR Network/s/\(Address=\).*/\1'"$address"'/m;P;d'  /etc/mmdvmhost
sed -i '/^\[/h;G;/DMR Network/s/\(Password=\).*/\1'"$passed"'/m;P;d'  /etc/mmdvmhost
sed -i '/^\[/h;G;/DMR Network/s/\(Port=\).*/\1'"$port"'/m;P;d'  /etc/mmdvmhost

mmdvmhost.service restart
sudo mount -o remount,ro /
