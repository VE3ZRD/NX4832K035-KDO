
#!/bin/bash
############################################################
#  Get  Profile from profiles.txt                          #
#  Returns a multi string | Separated                      #
#                                                          #
#                                                          #
#  VE3RD                                     2020-05-12    #
############################################################
set -o errexit
#set -o pipefail
ver="20240505"
dirn=/usr/local/etc/Nextion_Support/profiles.txt
pwf=/home/pi-star/pwfile.txt

/usr/local/etc/Nextion_Support/chkpwfile.sh
	pnum=$(sed -nr "/^\[LastProfile\]/ { :l /^LPNum[ ]*=/ { s/.*=[ ]*//; p; q;}; n; b l;}" $dirn)


        m1=$(sed -nr "/^\[Profile "$pnum"\]/ { :l /^Address[ ]*=/ { s/.*=[ ]*//; p; q;}; n; b l;}" $dirn)
        m2=$(sed -nr "/^\[Profile "$pnum"\]/ { :l /^Mode[ ]*=/ { s/.*=[ ]*//; p; q;}; n; b l;}" $dirn)
        m3=$(sed -nr "/^\[Profile "$pnum"\]/ { :l /^Port[ ]*=/ { s/.*=[ ]*//; p; q;}; n; b l;}" $dirn)
        m5=$(sed -nr "/^\[Profile "$pnum"\]/ { :l /^Name[ ]*=/ { s/.*=[ ]*//; p; q;}; n; b l;}" $dirn)
        m6=$(sed -nr "/^\[Profile "$pnum"\]/ { :l /^TalkGroup[ ]*=/ { s/.*=[ ]*//; p; q;}; n; b l;}" $dirn)

        pww1=$(echo "$m1" | cut -d "." -f 1)
        pww2=$(echo "$m1" | cut -d "." -f 2)
        pww3=$(echo "$m1" | cut -d "'" -f 3)

	m42=$(sed -nr "/^\[Networks\]/ { :l /^MNET[ ]*=/ { s/.*=[ ]*//; p; q;}; n; b l;}" $pwf)
        m43=$(sed -nr "/^\[Networks\]/ { :l /^BM[ ]*=/ { s/.*=[ ]*//; p; q;}; n; b l;}" $pwf)
        m41=$(sed -nr "/^\[Networks\]/ { :l /^TGIF[ ]*=/ { s/.*=[ ]*//; p; q;}; n; b l;}" $pwf)

	if [ "$pww1" = 127 ] 
		then
		m4=$(sed -nr "/^\[Networks\]/ { :l /^TGIF[ ]*=/ { s/.*=[ ]*//; p; q;}; n; b l;}" $pwf)

	fi

	if [ "$pww2" = mnet ]
		 then
                m4=$(sed -nr "/^\[Networks\]/ { :l /^MNET[ ]*=/ { s/.*=[ ]*//; p; q;}; n; b l;}" $pwf)
	
	fi

	if [ "$pww3" = BM ]
		then
                m4=$(sed -nr "/^\[Networks\]/ { :l /^BM[ ]*=/ { s/.*=[ ]*//; p; q;}; n; b l;}" $pwf)
	fi
   mt="2|$pnum|$m1|$m2|$m3|$m4|$m5|$m6"
echo "$mt"

