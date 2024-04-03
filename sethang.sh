#!/bin/bash
####################################################################
#  Change ModeHang in /etc/mmdvmhost                               #
#  $1 1-10 Select Mode/Network to change     $2 new nethang value  #
#                                                                  #
#  KF6S                                                 11-04-2019 #
####################################################################
set -o errexit
set -o pipefail

# Set value in $2 for Mode/Network
if [ -z "$10" ]; then
        exit
 else
sudo mount -o remount,rw /
sudo /usr/local/sbin/mmdvmhost.service stop  > /dev/null


p10=${10}
	sudo sed -i '/^\[/h;G;/D-Star/s/\(ModeHang=\).*/\1'"$1"'/m;P;d' /etc/mmdvmhost
	sudo sed -i '/^\[/h;G;/D-Star Network/s/\(ModeHang=\).*/\1'"$2"'/m;P;d' /etc/mmdvmhost

	sudo sed -i '/^\[/h;G;/DMR/s/\(ModeHang=\).*/\1'"$3"'/m;P;d' /etc/mmdvmhost
	sudo sed -i '/^\[/h;G;/DMR Network/s/\(ModeHang=\).*/\1'"$4"'/m;P;d' /etc/mmdvmhost

	sudo sed -i '/^\[/h;G;/System Fusion/s/\(ModeHang=\).*/\1'"$5"'/m;P;d' /etc/mmdvmhost
	sudo sed -i '/^\[/h;G;/System Fusion Network/s/\(ModeHang=\).*/\1'"$6"'/m;P;d' /etc/mmdvmhost

	sudo sed -i '/^\[/h;G;/P25/s/\(ModeHang=\).*/\1'"$7"'/m;P;d' /etc/mmdvmhost
	sudo sed -i '/^\[/h;G;/P25 Network/s/\(ModeHang=\).*/\1'"$8"'/m;P;d' /etc/mmdvmhost

	sudo sed -i '/^\[/h;G;/NXDN/s/\(ModeHang=\).*/\1'"$9"'/m;P;d' /etc/mmdvmhost
	sudo sed -i '/^\[/h;G;/NXDN Network/s/\(ModeHang=\).*/\1'"$p10"'/m;P;d' /etc/mmdvmhost
echo "$p10"
fi;
sudo /usr/local/sbin/mmdvmhost.service start  > /dev/null
sudo mount -o remount,rw /
