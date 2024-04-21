#!/bin/bash
############################################################
#   Set Colors on Colors.ini                               #
#  						           #
#  						           #
#  VE3RD                                        3024-04-17  #
############################################################
set -o errexit
set -o pipefail
# Check all six modes and set each one to either 0 or 1

if [ -z "$3" ]; then
        exit
  else
sudo mount -o remount,rw /
declare -i m1 # Split
declare -i m3 # MMDVM On
declare -i m4 # DMR On
declare -i m5 # YSF On
declare -i m6 # P25 On
declare -i m7 # NXDN
declare -i m8 # D-Star
declare -i m9 # NXDN
declare -i mt

     sudo sed -i '/^\[/h;G;/General/s/\(Color=\).*/\1'"$1"'/m;P;d'  /usr/local/etc/Nextion_Support/Colors.ini
     sudo sed -i '/^\[/h;G;/General/s/\(Split=\).*/\1'"$2"'/m;P;d'  /usr/local/etc/Nextion_Support/Colors.ini


m0="$3"
m1=$((m0&1))
m2=$((m0&2))
m3=$((m0&4))
m4=$((m0&8))
m5=$((m0&16))
m6=$((m0&32))
if [ "$m1" == 1 ]; then
     sudo sed -i '/^\[/h;G;/MMDVM/s/\(Enable=\).*/\1'"1"'/m;P;d'  /usr/local/etc/Nextion_Support/Colors.ini
else
     sudo sed -i '/^\[/h;G;/MMDVM/s/\(Enable=\).*/\1'"0"'/m;P;d'  /usr/local/etc/Nextion_Support/Colors.ini
fi

if [ "$m2" == 2 ]; then
     sudo sed -i '/^\[/h;G;/DMR/s/\(Enable=\).*/\1'"1"'/m;P;d'  /usr/local/etc/Nextion_Support/Colors.ini
else
	sudo sed -i '/\[DMR\]/!b;n;cEnable='"0"'' /usr/local/etc/Nextion_Support/Colors.ini
fi

if [ "$m3" == 4 ]; then
     sudo sed -i '/^\[/h;G;/YSF/s/\(Enable=\).*/\1'"1"'/m;P;d'  /usr/local/etc/Nextion_Support/Colors.ini
else
	sudo sed -i '/\[YSF\]/!b;n;cEnable='"0"'' /usr/local/etc/Nextion_Support/Colors.ini
fi

if [ "$m4" == 8 ]; then
     sudo sed -i '/^\[/h;G;/P25/s/\(Enable=\).*/\1'"1"'/m;P;d'  /usr/local/etc/Nextion_Support/Colors.ini
else
     sudo sed -i '/^\[/h;G;/P25/s/\(Enable=\).*/\1'"0"'/m;P;d'  /usr/local/etc/Nextion_Support/Colors.ini
fi

if [ "$m5" == 16 ]; then
     sudo sed -i '/^\[/h;G;/NXDN/s/\(Enable=\).*/\1'"1"'/m;P;d'  /usr/local/etc/Nextion_Support/Colors.ini
else
     sudo sed -i '/^\[/h;G;/NXDN/s/\(Enable=\).*/\1'"0"'/m;P;d'  /usr/local/etc/Nextion_Support/Colors.ini
fi

if [ "$m6" == 32 ]; then
     sudo sed -i '/^\[/h;G;/D-Star/s/\(Enable=\).*/\1'"1"'/m;P;d'  /usr/local/etc/Nextion_Support/Colors.ini
else
     sudo sed -i '/^\[/h;G;/D-Star/s/\(Enable=\).*/\1'"0"'/m;P;d'  /usr/local/etc/Nextion_Support/Colors.ini
fi

 sudo mmdvmhost.service restart
sudo mount -o remount,ro /

fi;
