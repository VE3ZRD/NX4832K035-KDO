#!/bin/bash
############################################################
#  Get Color Info from /usr/local/etc/Colors.ini           #
#                                                          #
#  Returns a Binary Coded Value                            #
#                                                          #
#  VE3RD                                      2024-04-17   #
############################################################
set -o errexit
set -o pipefail

#declare -i m1 # Color Num  
declare -i m2 # Split
declare -i m3 # MMDVM On
declare -i m4 # DMR On
declare -i m5 # YSF On
declare -i m6 # P25 On
declare -i m7 # NXDN
declare -i m8 # D-Star 
declare -i m9 # NXDN
declare -i mt 

# Color Numbers
# Teal=1
# Black=2
# Green=3
# Yellow=4
# Blue=5
# Red=6

m1=$(sed -nr "/^\[General]/ { :1 /^Color[ ]*=/ { s/.*=[ ]*//; p; q;}; n; b 1;}" /usr/local/etc/Nextion_Support/Colors.ini)
m2=$(sed -nr "/^\[General]/ { :1 /^LastSplit[ ]*=/ { s/.*=[ ]*//; p; q;}; n; b 1;}" /usr/local/etc/Nextion_Support/Colors.ini)

m3=$(sed -nr "/^\[MMDVM]/ { :1 /^Enable[ ]*=/ { s/.*=[ ]*//; p; q;}; n; b 1;}" /usr/local/etc/Nextion_Support/Colors.ini)
m4=$(sed -nr "/^\[DMR]/ { :1 /^Enable[ ]*=/ { s/.*=[ ]*//; p; q;}; n; b 1;}" /usr/local/etc/Nextion_Support/Colors.ini)
m5=$(sed -nr "/^\[YSF]/ { :1 /^Enable[ ]*=/ { s/.*=[ ]*//; p; q;}; n; b 1;}" /usr/local/etc/Nextion_Support/Colors.ini)
m6=$(sed -nr "/^\[P25]/ { :1 /^Enable[ ]*=/ { s/.*=[ ]*//; p; q;}; n; b 1;}" /usr/local/etc/Nextion_Support/Colors.ini)
m7=$(sed -nr "/^\[NXDN]/ { :1 /^Enable[ ]*=/ { s/.*=[ ]*//; p; q;}; n; b 1;}" /usr/local/etc/Nextion_Support/Colors.ini)
m8=$(sed -nr "/^\[D-Star]/ { :1 /^Enable[ ]*=/ { s/.*=[ ]*//; p; q;}; n; b 1;}" /usr/local/etc/Nextion_Support/Colors.ini)
mt="$m3 + ($m4*2) + ($m5*4) + ($m6*8) + ($m7*16) + ($m8*32)"
 

mt1="$m1|$m2|$mt"
echo "$mt1"
#echo "$mt1"

##m7=$(sed -nr "/^\[DMR]/ { :1 /^Id[ ]*=/ { s/.*=[ ]*//; p; q;}; n; b 1;}" /etc/mmdvmhost)


