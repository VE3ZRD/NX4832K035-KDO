#!/bin/bash
############################################################
#  Set profile                                       #
#  VE3RD                                      2019/10/28   #
############################################################
set -o errexit
set -o pipefail
sudo mount -o remount,rw /
args=("$@")


#echo "Save to profile"

dirn=/usr/local/etc/Nextion_Support/profiles.txt
pwf=/home/pi-star/pwfile.txt

/usr/local/etc/Nextion_Support/chkpwfile.sh

if [ -z "$1" ]; then
   exit
else
ver="20240505"
dirn=/usr/local/etc/Nextion_Support/profiles.txt
pwf=/home/pi-star/pwfile.txt
/usr/local/etc/Nextion_Support/chkpwfile.sh

 	pnum="$1"
	sudo sed -i '/^\[/h;G;/LastProfile/s/\(LPNum=\).*/\1'"$1"'/m;P;d'  /usr/local/etc/Nextion_Support/profiles.txt
 
        m1=$(sed -nr "/^\[Profile "$pnum"\]/ { :l /^RXOffset[ ]*=/ { s/.*=[ ]*//; p; q;}; n; b l;}" $dirn)
        m2=$(sed -nr "/^\[Profile "$pnum"\]/ { :l /^TXOffset[ ]*=/ { s/.*=[ ]*//; p; q;}; n; b l;}" $dirn)
        m3=$(sed -nr "/^\[Profile "$pnum"\]/ { :l /^RXFrequency[ ]*=/ { s/.*=[ ]*//; p; q;}; n; b l;}" $dirn)
        m4=$(sed -nr "/^\[Profile "$pnum"\]/ { :l /^TXFrequency[ ]*=/ { s/.*=[ ]*//; p; q;}; n; b l;}" $dirn)
        m5=$(sed -nr "/^\[Profile "$pnum"\]/ { :l /^Callsign[ ]*=/ { s/.*=[ ]*//; p; q;}; n; b l;}" $dirn)
        m6=$(sed -nr "/^\[Profile "$pnum"\]/ { :l /^Id[ ]*=/ { s/.*=[ ]*//; p; q;}; n; b l;}" $dirn)

        m7=$(sed -nr "/^\[Profile "$pnum"\]/ { :l /^Address[ ]*=/ { s/.*=[ ]*//; p; q;}; n; b l;}" $dirn)
        m8=$(sed -nr "/^\[Profile "$pnum"\]/ { :l /^Mode[ ]*=/ { s/.*=[ ]*//; p; q;}; n; b l;}" $dirn)
        m9=$(sed -nr "/^\[Profile "$pnum"\]/ { :l /^Port[ ]*=/ { s/.*=[ ]*//; p; q;}; n; b l;}" $dirn)
####
        m11=$(sed -nr "/^\[Profile "$pnum"\]/ { :l /^Name[ ]*=/ { s/.*=[ ]*//; p; q;}; n; b l;}" $dirn)
        m12=$(sed -nr "/^\[Profile "$pnum"\]/ { :l /^TalkGroup[ ]*=/ { s/.*=[ ]*//; p; q;}; n; b l;}" $dirn)

        pww1=$(echo "$m7" | cut -d "." -f 1)
        pww2=$(echo "$m7" | cut -d "." -f 2)
        pww3=$(echo "$m7" | cut -d "'" -f 3)


	p10=${args[10]}  
	p11=${args[11]}  
	p12=${args[12]}  

	sudo sed -i '/^\[/h;G;/Profile 0/s/\(RXOffset=\).*/\1'"$m1"'/m;P;d'  /usr/local/etc/Nextion_Support/profiles.txt
	sudo sed -i '/^\[/h;G;/Profile 0/s/\(TXOffset=\).*/\1'"$m2"'/m;P;d'  /usr/local/etc/Nextion_Support/profiles.txt
	sudo sed -i '/^\[/h;G;/Profile 0/s/\(RXFrequency=\).*/\1'"$m3"'/m;P;d'  /usr/local/etc/Nextion_Support/profiles.txt
	sudo sed -i '/^\[/h;G;/Profile 0/s/\(TXFrequency=\).*/\1'"$m4"'/m;P;d'  /usr/local/etc/Nextion_Support/profiles.txt
	sudo sed -i '/^\[/h;G;/Profile 0/s/\(Callsign=\).*/\1'"$m5"'/m;P;d'  /usr/local/etc/Nextion_Support/profiles.txt
	sudo sed -i '/^\[/h;G;/Profile 0/s/\(Id=\).*/\1'"$m6"'/m;P;d'  /usr/local/etc/Nextion_Support/profiles.txt

	sudo sed -i '/^\[/h;G;/Profile 0/s/\(Address=\).*/\1'"$m7"'/m;P;d'  /usr/local/etc/Nextion_Support/profiles.txt
	sudo sed -i '/^\[/h;G;/Profile 0/s/\(Mode=\).*/\1'"$m8"'/m;P;d'  /usr/local/etc/Nextion_Support/profiles.txt
	sudo sed -i '/^\[/h;G;/Profile 0/s/\(Port=\).*/\1'"$m9"'/m;P;d'  /usr/local/etc/Nextion_Support/profiles.txt
	sudo sed -i '/^\[/h;G;/Profile 0/s/\(Name=\).*/\1'"$m11"'/m;P;d'  /usr/local/etc/Nextion_Support/profiles.txt
	sudo sed -i '/^\[/h;G;/Profile 0/s/\(TalkGroup=\).*/\1'"$m12"'/m;P;d'  /usr/local/etc/Nextion_Support/profiles.txt


	
        pw1=$(echo "$m7" | cut -d "." -f1)
        pw2=$(echo "$m7" | cut -d "." -f3)

        if [ "$pw1" = 127 ]
                then
                m14=$(sed -nr "/^\[Networks\]/ { :l /^TGIF[ ]*=/ { s/.*=[ ]*//; p; q;}; n; b l;}" $pwf)

        fi

        if [ "$pw2" = mnet ]
                 then
                m14=$(sed -nr "/^\[Networks\]/ { :l /^MNET[ ]*=/ { s/.*=[ ]*//; p; q;}; n; b l;}" $pwf)

        fi

        if [ "$pw3" = BM ]
                then
                m14=$(sed -nr "/^\[Networks\]/ { :l /^BM[ ]*=/ { s/.*=[ ]*//; p; q;}; n; b l;}" $pwf)
        fi






        if [ "$m7" == tgif ] || [ "$m7" == 127 ]; then
		sudo sed -i '/^\[/h;G;/Networks/s/\(TGIF=\).*/\1'"$m14"'/m;P;d'  /home/pi-star/psfile.txt
        fi

        if [ "$pw1" == mnet ]; then
		sudo sed -i '/^\[/h;G;/Networks/s/\(MNET=\).*/\1'"$m14"'/m;P;d'  /home/pi-star/psfile.txt
        fi
        if [ "$pw1" == branmeister ]; then
		sudo sed -i '/^\[/h;G;/Networks/s/\(BM=\).*/\1'"$m14"'/m;P;d'  /home/pi-star/psfile.txt
        fi


fi;
