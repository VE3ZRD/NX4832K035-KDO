
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

		pnum=$(sed -nr "/^\[LastProfile\]/ { :l /^LPNum[ ]*=/ { s/.*=[ ]*//; p; q;}; n; b l;}" $dirn)

                m1=$(sed -nr "/^\[Profile "$pnum"\]/ { :l /^Address[ ]*=/ { s/.*=[ ]*//; p; q;}; n; b l;}" $dirn)
                m2=$(sed -nr "/^\[Profile "$pnum"\]/ { :l /^Mode[ ]*=/ { s/.*=[ ]*//; p; q;}; n; b l;}" $dirn)
                m3=$(sed -nr "/^\[Profile "$pnum"\]/ { :l /^Port[ ]*=/ { s/.*=[ ]*//; p; q;}; n; b l;}" $dirn)
                m4=$(sed -nr "/^\[Profile "$pnum"\]/ { :l /^Password[ ]*=/ { s/.*=[ ]*//; p; q;}; n; b l;}" $dirn)
                m5=$(sed -nr "/^\[Profile "$pnum"\]/ { :l /^Name[ ]*=/ { s/.*=[ ]*//; p; q;}; n; b l;}" $dirn)
                m6=$(sed -nr "/^\[Profile "$pnum"\]/ { :l /^TalkGroup[ ]*=/ { s/.*=[ ]*//; p; q;}; n; b l;}" $dirn)
                mt="2|$pnum|$m1|$m2|$m3|$m4|$m5|$m6"
		echo "$mt"


