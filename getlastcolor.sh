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
#SetNum="$1"

cfile=/etc/Colors.ini

m3=$(sed -n '/^[ \t]*\[LASTSET\]/,/\[/s/^[ \t]*UpperBack[ \t]*=[ \t]*//p' "$cfile")
m4=$(sed -n '/^[ \t]*\[LASTSET\]/,/\[/s/^[ \t]*UpperText[ \t]*=[ \t]*//p' "$cfile")
m5=$(sed -n '/^[ \t]*\[LASTSET\]/,/\[/s/^[ \t]*LowerBack[ \t]*=[ \t]*//p' "$cfile")
m6=$(sed -n '/^[ \t]*\[LASTSET\]/,/\[/s/^[ \t]*LowerText[ \t]*=[ \t]*//p' "$cfile")

m1=$(sed -n '/^[ \t]*\[LASTSET\]/,/\[/s/^[ \t]*LastNum[ \t]*=[ \t]*//p' "$cfile")
m2=$(sed -n '/^[ \t]*\[LASTSET\]/,/\[/s/^[ \t]*LastSplit[ \t]*=[ \t]*//p' "$cfile")

mt="$m1|$m2|$m3|$m4|$m5|$m6"
echo "$mt"
