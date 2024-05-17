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
m1=$(grep "$srch" /var/log/pi-star/MMDVM* | tail -1 | cut -d " " -f 2)
m2=$(grep "$srch" /var/log/pi-star/MMDVM* | tail -1 | cut -d " " -f 3)
m3=$(grep "$srch" /var/log/pi-star/MMDVM* | tail -1 | cut -d " " -f 4)
m4=$(grep "$srch" /var/log/pi-star/MMDVM* | tail -1 | cut -d " " -f 14)
m5=$(grep "$srch" /var/log/pi-star/MMDVM* | tail -1 | cut -d " " -f 17 | cut -d "," -f1)
m6=$(grep "$srch" /var/log/pi-star/MMDVM* | tail -1 | cut -d " " -f 18)
m7=$(grep "$srch" /var/log/pi-star/MMDVM* | tail -1 | cut -d " " -f 20)

if [ "$m7" == BER: ]; then
#	m7a=$(grep "$srch" /var/log/pi-star/MMDVM* | tail -1 | cut -d " " -f 20)
	m7b=$(grep "$srch" /var/log/pi-star/MMDVM* | tail -1 | cut -d " " -f 21)
	m7="$m7 $m7b"
fi

echo "$m4|$m1|$m2|$m3|$m5|$m6|$m7"
