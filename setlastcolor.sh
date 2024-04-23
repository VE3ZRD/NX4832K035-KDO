#!/bin/bash
############################################################
#   Set Colors on Colors.ini                               #
#  						           #
#  						           #
#  VE3RD                                        3024-04-17  #
############################################################
set -o errexit
set -o pipefail

if [ -z "$6" ]; then
        exit
  else
sudo mount -o remount,rw /

sudo sed -i '/^\[/h;G;/LASTSET/s/\(LastNum=\).*/\1'"$1"'/m;P;d'  /usr/local/etc/Nextion_Support/Colors.ini
sudo sed -i '/^\[/h;G;/LASTSET/s/\(LastSplit=\).*/\1'"$2"'/m;P;d'  /usr/local/etc/Nextion_Support/Colors.ini

sudo sed -i '/^\[/h;G;/LASTSET/s/\(UpperBack=\).*/\1'"$3"'/m;P;d'  /usr/local/etc/Nextion_Support/Colors.ini
sudo sed -i '/^\[/h;G;/LASTSET/s/\(UpperText=\).*/\1'"$4"'/m;P;d'  /usr/local/etc/Nextion_Support/Colors.ini
sudo sed -i '/^\[/h;G;/LASTSET/s/\(LowerBack=\).*/\1'"$5"'/m;P;d'  /usr/local/etc/Nextion_Support/Colors.ini
sudo sed -i '/^\[/h;G;/LASTSET/s/\(LowerText=\).*/\1'"$6"'/m;P;d'  /usr/local/etc/Nextion_Support/Colors.ini


sudo sed -i '/^\[/h;G;/ColorSet'"$1"'/s/\(UpperBack=\).*/\1'"$3"'/m;P;d'  /usr/local/etc/Nextion_Support/Colors.ini
sudo sed -i '/^\[/h;G;/ColorSet'"$1"'/s/\(UpperText=\).*/\1'"$4"'/m;P;d'  /usr/local/etc/Nextion_Support/Colors.ini
sudo sed -i '/^\[/h;G;/ColorSet'"$1"'/s/\(LowerBack=\).*/\1'"$5"'/m;P;d'  /usr/local/etc/Nextion_Support/Colors.ini
sudo sed -i '/^\[/h;G;/ColorSet'"$1"'/s/\(LowerText=\).*/\1'"$6"'/m;P;d'  /usr/local/etc/Nextion_Support/Colors.ini
sudo sed -i '/^\[/h;G;/ColorSet'"$1"'/s/\(Split=\).*/\1'"$2"'/m;P;d'  /usr/local/etc/Nextion_Support/Colors.ini


sudo mount -o remount,ro /

fi;
