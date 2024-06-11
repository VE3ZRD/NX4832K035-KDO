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

cfile=/etc/Colors.ini

if [ "$SetNum" == "" ]; then
	m1=$(sed -n '/^[ \t]*\[LASTSET\]/,/\[/s/^[ \t]*LastNum[ \t]*=[ \t]*//p' "$cfile")
	m2=$(sed -n '/^[ \t]*\[LASTSET\]/,/\[/s/^[ \t]*LastSplit[ \t]*=[ \t]*//p' "$cfile")

	m3=$(sed -n '/^[ \t]*\[LASTSET\]/,/\[/s/^[ \t]*UpperBack[ \t]*=[ \t]*//p' "$cfile")
	m4=$(sed -n '/^[ \t]*\[LASTSET\]/,/\[/s/^[ \t]*UpperText[ \t]*=[ \t]*//p' "$cfile")
	m5=$(sed -n '/^[ \t]*\[LASTSET\]/,/\[/s/^[ \t]*LowerBack[ \t]*=[ \t]*//p' "$cfile")
	m6=$(sed -n '/^[ \t]*\[LASTSET\]/,/\[/s/^[ \t]*LowerText[ \t]*=[ \t]*//p' "$cfile")

	m7=$(sed -n '/^[ \t]*\[MMDVM\]/,/\[/s/^[ \t]*SetNum[ \t]*=[ \t]*//p' "$cfile")
	m8=$(sed -n '/^[ \t]*\[DMR\]/,/\[/s/^[ \t]*SetNum[ \t]*=[ \t]*//p' "$cfile")
	m9=$(sed -n '/^[ \t]*\[YSF\]/,/\[/s/^[ \t]*SetNum[ \t]*=[ \t]*//p' "$cfile")
	m10=$(sed -n '/^[ \t]*\[NXDN\]/,/\[/s/^[ \t]*SetNum[ \t]*=[ \t]*//p' "$cfile")
	m11=$(sed -n '/^[ \t]*\[P25\]/,/\[/s/^[ \t]*SetNum[ \t]*=[ \t]*//p' "$cfile")
	m12=$(sed -n '/^[ \t]*\[DSTAR\]/,/\[/s/^[ \t]*SetNum[ \t]*=[ \t]*//p' "$cfile")

	mt="$m1|$m2|$m3|$m4|$m5|$m6|$m7|$m8|$m9|$m10|$m11|$m12"
	echo "$mt"

else

    case "$SetNum" in
        "1")
		sp=$(sed -n '/^[ \t]*\[MMDVM\]/,/\[/s/^[ \t]*Split[ \t]*=[ \t]*//p' "$cfile")
		sn=$(sed -n '/^[ \t]*\[MMDVM\]/,/\[/s/^[ \t]*SetNum[ \t]*=[ \t]*//p' "$cfile")

            ;;
        "2")
		sp=$(sed -n '/^[ \t]*\[DMR\]/,/\[/s/^[ \t]*Split[ \t]*=[ \t]*//p' "$cfile")
		sn=$(sed -n '/^[ \t]*\[DMR\]/,/\[/s/^[ \t]*SetNum[ \t]*=[ \t]*//p' "$cfile")
            ;;
        "3")
                sp=$(sed -n '/^[ \t]*\[YSF\]/,/\[/s/^[ \t]*Split[ \t]*=[ \t]*//p' "$cfile")
                sn=$(sed -n '/^[ \t]*\[YSF\]/,/\[/s/^[ \t]*SetNum[ \t]*=[ \t]*//p' "$cfile")
            ;;
        "4")
                sp=$(sed -n '/^[ \t]*\[NXDN\]/,/\[/s/^[ \t]*Split[ \t]*=[ \t]*//p' "$cfile")
                sn=$(sed -n '/^[ \t]*\[NXDN\]/,/\[/s/^[ \t]*SetNum[ \t]*=[ \t]*//p' "$cfile")
            ;;
        "5")
                sp=$(sed -n '/^[ \t]*\[P25\]/,/\[/s/^[ \t]*Split[ \t]*=[ \t]*//p' "$cfile")
                sn=$(sed -n '/^[ \t]*\[P25\]/,/\[/s/^[ \t]*SetNum[ \t]*=[ \t]*//p' "$cfile")
            ;;
        "6")
                sp=$(sed -n '/^[ \t]*\[DSTAR\]/,/\[/s/^[ \t]*Split[ \t]*=[ \t]*//p' "$cfile")
                sn=$(sed -n '/^[ \t]*\[DSTAR\]/,/\[/s/^[ \t]*SetNum[ \t]*=[ \t]*//p' "$cfile")
            ;;
        *) echo "invalid option $REPLY";;
    esac
		m1=$(sed -n '/^[ \t]*\[ColorSet'"$sn"'\]/,/\[/s/^[ \t]*UpperBack[ \t]*=[ \t]*//p' "$cfile")
		m2=$(sed -n '/^[ \t]*\[ColorSet'"$sn"'\]/,/\[/s/^[ \t]*UpperText[ \t]*=[ \t]*//p' "$cfile")
		m3=$(sed -n '/^[ \t]*\[ColorSet'"$sn"'\]/,/\[/s/^[ \t]*LowerBack[ \t]*=[ \t]*//p' "$cfile")
		m4=$(sed -n '/^[ \t]*\[ColorSet'"$sn"'\]/,/\[/s/^[ \t]*LowerText[ \t]*=[ \t]*//p' "$cfile")


	mt="$sp|$m1|$m2|$m3|$m4"
	echo "$mt"

fi







