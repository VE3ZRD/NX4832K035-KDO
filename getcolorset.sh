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
SetNum="$1"

#f1=/usr/local/etc/Nextion_Support/Colors.ini
f1=/etc/Colors.ini

m1=$(sed -n '/^[ \t]*\[ColorSet'"$SetNum"'\]/,/\[/s/^[ \t]*UpperBack[ \t]*=[ \t]*//p' "$f1")
m2=$(sed -n '/^[ \t]*\[ColorSet'"$SetNum"'\]/,/\[/s/^[ \t]*UpperText[ \t]*=[ \t]*//p' "$f1")
m3=$(sed -n '/^[ \t]*\[ColorSet'"$SetNum"'\]/,/\[/s/^[ \t]*LowerBack[ \t]*=[ \t]*//p' "$f1")
m4=$(sed -n '/^[ \t]*\[ColorSet'"$SetNum"'\]/,/\[/s/^[ \t]*LowerText[ \t]*=[ \t]*//p' "$f1")
m5=$(sed -n '/^[ \t]*\[ColorSet'"$SetNum"'\]/,/\[/s/^[ \t]*Split[ \t]*=[ \t]*//p' "$f1")
#m5=$(sed -n '/^[ \t]*\[General\]/,/\[/s/^[ \t]*Split[ \t]*=[ \t]*//p' /usr/local/etc/Nextion_Support/Colors.ini)
mt="$SetNum|$m5|$m1|$m2|$m3|$m4"
echo "$mt"
