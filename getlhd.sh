#!/bin/bash
############################################################
#  Get Last Heard User Data		                   #
#                                                          #
#                                                          #
#  VE3RD                                      2024-05-17   #
############################################################
set -o errexit
set -o pipefail

#p1 Call
srch="end of voice transmission from $1"
m1=$(grep "$srch" /var/log/pi-star/MMDVM* | tail -1 | cut -d " " -f 18)
m2=$(grep "$srch" /var/log/pi-star/MMDVM* | tail -1 | cut -d " " -f 20)

echo "$m1|$m2"
