#!/bin/bash
###############################################################
# Support for Nextion Screen to format ESSID list for screen  #
#                                                             #
#                                                             #
#                                                             #
#                                                             #
# VE3RD                                           2024-04-27  #
###############################################################

#iwlist wlan0 scan | grep 'ESSID' | sed 's/.*ESSID:"\(.*\)".*/\1/g' | tr " " "\n"|sed -n '1p'
#main=$(iwlist wlan0 scan | grep 'ESSID' | sed 's/.*ESSID:"\(.*\)".*/\1/g')
main=$(iwlist wlan0 scanning | grep ESSID | grep -v "\"\"" | sed 's/.*ESSID:"\(.*\)".*/\1/g')
p1=$(echo "$main" | sed -n '1p')
p2=$(echo "$main" | sed -n '2p')
p3=$(echo "$main" | sed -n '3p')
p4=$(echo "$main" | sed -n '4p')
p5=$(echo "$main" | sed -n '5p')
p6=$(echo "$main" | sed -n '6p')
p7=$(echo "$main" | sed -n '7p')
p8=$(echo "$main" | sed -n '8p')
p9=$(echo "$main" | sed -n '9p')
p10=$(echo "$main" | sed -n '10p')
echo "$p1|$p2|$p3|$p4|$p5|$p6|$p7|$p8|$p9|$p10"
