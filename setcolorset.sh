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
SP="$2"

UB="$3"
UT="$4"
LB="$5"
LT="$6"

if [ -z "$6" ]; then
	SP="1"
fi

cfile=/etc/Colors.ini

sudo sed -i '/^\[/h;G;/Last/s/\(LastNum=\).*/\1'"$1"'/m;P;d'  "$cfile"
sudo sed -i '/^\[/h;G;/Last/s/\(LastSplit=\).*/\1'"$2"'/m;P;d'  "$cfile"

sudo sed -i '/^\[/h;G;/ColorSet'"$1"'/s/\(UpperBack=\).*/\1'"$3"'/m;P;d'  "$cfile"
sudo sed -i '/^\[/h;G;/ColorSet'"$1"'/s/\(UpperText=\).*/\1'"$4"'/m;P;d'  "$cfile"
sudo sed -i '/^\[/h;G;/ColorSet'"$1"'/s/\(LowerBack=\).*/\1'"$5"'/m;P;d'  "$cfile"
sudo sed -i '/^\[/h;G;/ColorSet'"$1"'/s/\(LowerText=\).*/\1'"$6"'/m;P;d'  "$cfile"
sudo sed -i '/^\[/h;G;/ColorSet'"$1"'/s/\(Split=\).*/\1'"$6"'/m;P;d'  "$cfile"



sudo mount -o remount,ro /

fi;
