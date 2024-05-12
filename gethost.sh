#!/bin/bash
############################################################
#  Get P25 NXDN YSF HOSTS FROM HOSTFILES                   #
#                                                          #
#                                                          #
#                                                          #
#                                                          #
#  VE3RD                                      2024-05-11   #
############################################################
set -o errexit
set -o pipefail

#p1=Mode
#p2=tg

if [ "$1" == P25 ]; then
	Line=$(grep -P "^$2\t" /usr/local/etc/P25*.txt)
	m0="P25 $2"
	m1=$(echo "$Line" | cut -d$'\t' -f2) 	# Address
	m2=$(echo "$Line" | cut -d$'\t' -f3)	# Port
	 echo "$m0|$m1|$m2"
fi

if [ "$1" == NXDN ]; then
	Line=$(grep -P "^$2\t" /usr/local/etc/NXDN*.txt)
	m0="NXDN $2"
	m1=$(echo "$Line" | cut -d$'\t' -f2)
	m2=$(echo "$Line" | cut -d$'\t' -f3)
	 echo "$m0|$m1|$m2"
fi

if [ "$1" == YSF ]; then
	Line=$(grep -P "^$2;" /usr/local/etc/YSF*.txt)
	m0=$(echo "$Line" | cut -d ";" -f2)		#Name
	m1=$(echo "$Line" | cut -d ";" -f4)		#Address
	m2=$(echo "$Line" | cut -d ";" -f5)		#Port
	 echo "$m0|$m1|$m2"
fi


