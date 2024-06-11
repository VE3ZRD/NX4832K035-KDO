#!/bin/bash
############################################################
#   Set Mode Color Set Numbers                             #
#  						           #
#  						           #
#  VE3RD                                       2024-06-10  #
############################################################
set -o errexit
set -o pipefail
# Check all six modes and set each one to either 0 or 1

cfile=/etc/Colors.ini
sudo mount -o remount,rw /

sudo sed -i '/^\[/h;G;/'"$1"'/s/\(SetNum=\).*/\1'"$2"'/m;P;d'  "$cfile"


sudo mount -o remount,ro /

