#!/bin/bash
############################################################
#  Get  Profile from profiles.txt                          #
#  Returns a multi string | Separated                      #
#                                                          #
#                                                          #
#  VE3RD                                     2020-05-12    #
############################################################
#set -o errexit
#set -o pipefail
ver="20240505"
dirn=/usr/local/etc/Nextion_Support/profiles.txt
#declare -i pnum

		pnum="$1"
		m1=$(sed -nr "/^\[Profile "$pnum"\]/ { :l /^RXOffset[ ]*=/ { s/.*=[ ]*//; p; q;}; n; b l;}" $dirn)
		m2=$(sed -nr "/^\[Profile "$pnum"\]/ { :l /^TXOffset[ ]*=/ { s/.*=[ ]*//; p; q;}; n; b l;}" $dirn)
		m3=$(sed -nr "/^\[Profile "$pnum"\]/ { :l /^RXFrequency[ ]*=/ { s/.*=[ ]*//; p; q;}; n; b l;}" $dirn)
		m4=$(sed -nr "/^\[Profile "$pnum"\]/ { :l /^TXFrequency[ ]*=/ { s/.*=[ ]*//; p; q;}; n; b l;}" $dirn)
		m5=$(sed -nr "/^\[Profile "$pnum"\]/ { :l /^Callsign[ ]*=/ { s/.*=[ ]*//; p; q;}; n; b l;}" $dirn)
		m6=$(sed -nr "/^\[Profile "$pnum"\]/ { :l /^Id[ ]*=/ { s/.*=[ ]*//; p; q;}; n; b l;}" $dirn)
               	mt="1|$pnum|$m1|$m2|$m3|$m4|$m5|$m6"
		echo "$mt"		

