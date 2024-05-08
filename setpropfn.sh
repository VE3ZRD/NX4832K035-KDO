#!/bin/bash
############################################################
#  Set Profile  Field                                      #
#  VE3RD                                      2019/10/28   #
############################################################
set -o errexit
set -o pipefail
sudo mount -o remount,rw /
#echo "Save to Field to Profile"

dirn=/usr/local/etc/Nextion_Support/profiles.txt
#p1=Profile Num
#p2=Field Name
#p3=Field Value

if [ -z "$1" ]; then
   exit
else
	# Save selected profile
	sudo sed -i '/^\[/h;G;/Profile '"$1"'/s/\('"$2"'=\).*/\1'"$3"'/m;P;d'  /usr/local/etc/Nextion_Support/profiles.txt
fi

