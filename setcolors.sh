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
SetNum="$1"
UB="$2"
UT="$3"
LB="$4"
LT="$5"
SP="$6"
if [ -z "$6" ]; then
SP="1"
fi

cfile=/etc/Colors.ini


sudo sed -i '/^\[/h;G;/ColorSet'"$SetNum"'/s/\(UpperBack=\).*/\1'"$UB"'/m;P;d'  "$cfile"
sudo sed -i '/^\[/h;G;/ColorSet'"$SetNum"'/s/\(UpperText=\).*/\1'"$UT"'/m;P;d'  "$cfile"
sudo sed -i '/^\[/h;G;/ColorSet'"$SetNum"'/s/\(LowerBack=\).*/\1'"$LB"'/m;P;d'  "$cfile"
sudo sed -i '/^\[/h;G;/ColorSet'"$SetNum"'/s/\(LowerText=\).*/\1'"$LT"'/m;P;d'  "$cfile"

sudo sed -i '/^\[/h;G;/General/s/\(LastUsed=\).*/\1'"$1"'/m;P;d'  "$cfile"
sudo sed -i '/^\[/h;G;/General/s/\(Split=\).*/\1'"$SP"'/m;P;d'  "$cfile"


sudo mount -o remount,ro /

fi;
