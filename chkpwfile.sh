#!/bin/bash
############################################################
#  Apply Selected Profile				   #
#                                                          #
#  VE3RD                                        2024-05-05 #
############################################################
set -o errexit
set -o pipefail

if [ ! -f /home/pi-star/pwfile.txt ]; then
sudo mount -o remount,rw /
 echo "Copy File"
 sudo cp /usr/local/etc/Nextion_Support/pwfile.txt /home/pi-star/
sudo mount -o remount,ro /

fi
