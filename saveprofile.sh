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
	p10=${args[10]}  
	p11=${args[11]}  
	p12=${args[12]}  
    if [ "$1" == A ]; then
	# Save selected profile
	sudo sed -i '/^\[/h;G;/LastProfile/s/\(LPNum=\).*/\1'"$2"'/m;P;d'  /usr/local/etc/Nextion_Support/profiles.txt
	#
	sudo sed -i '/^\[/h;G;/Profile '"$2"'/s/\(RXOffset=\).*/\1'"$3"'/m;P;d'  /usr/local/etc/Nextion_Support/profiles.txt
	sudo sed -i '/^\[/h;G;/Profile '"$2"'/s/\(TXOffset=\).*/\1'"$4"'/m;P;d'  /usr/local/etc/Nextion_Support/profiles.txt
	sudo sed -i '/^\[/h;G;/Profile '"$2"'/s/\(RXFrequency=\).*/\1'"$5"'/m;P;d'  /usr/local/etc/Nextion_Support/profiles.txt
	sudo sed -i '/^\[/h;G;/Profile '"$2"'/s/\(TXFrequency=\).*/\1'"$6"'/m;P;d'  /usr/local/etc/Nextion_Support/profiles.txt
	sudo sed -i '/^\[/h;G;/Profile '"$2"'/s/\(Callsign=\).*/\1'"$7"'/m;P;d'  /usr/local/etc/Nextion_Support/profiles.txt
	sudo sed -i '/^\[/h;G;/Profile '"$2"'/s/\(Id=\).*/\1'"$8"'/m;P;d'  /usr/local/etc/Nextion_Support/profiles.txt

	sudo sed -i '/^\[/h;G;/Profile 0/s/\(RXOffset=\).*/\1'"$3"'/m;P;d'  /usr/local/etc/Nextion_Support/profiles.txt
	sudo sed -i '/^\[/h;G;/Profile 0/s/\(TXOffset=\).*/\1'"$4"'/m;P;d'  /usr/local/etc/Nextion_Support/profiles.txt
	sudo sed -i '/^\[/h;G;/Profile 0/s/\(RXFrequency=\).*/\1'"$5"'/m;P;d'  /usr/local/etc/Nextion_Support/profiles.txt
	sudo sed -i '/^\[/h;G;/Profile 0/s/\(TXFrequency=\).*/\1'"$6"'/m;P;d'  /usr/local/etc/Nextion_Support/profiles.txt
	sudo sed -i '/^\[/h;G;/Profile 0/s/\(Callsign=\).*/\1'"$7"'/m;P;d'  /usr/local/etc/Nextion_Support/profiles.txt
	sudo sed -i '/^\[/h;G;/Profile 0/s/\(Id=\).*/\1'"$8"'/m;P;d'  /usr/local/etc/Nextion_Support/profiles.txt
    fi	

    if [ "$1" == B ]; then

	sudo sed -i '/^\[/h;G;/Profile '"$2"'/s/\(Address=\).*/\1'"$3"'/m;P;d'  /usr/local/etc/Nextion_Support/profiles.txt
	sudo sed -i '/^\[/h;G;/Profile '"$2"'/s/\(Mode=\).*/\1'"$4"'/m;P;d'  /usr/local/etc/Nextion_Support/profiles.txt
	sudo sed -i '/^\[/h;G;/Profile '"$2"'/s/\(Port=\).*/\1'"$5"'/m;P;d'  /usr/local/etc/Nextion_Support/profiles.txt

	sudo sed -i '/^\[/h;G;/Profile '"$2"'/s/\(Password=\).*/\1'"PWFILE"'/m;P;d'  /usr/local/etc/Nextion_Support/profiles.txt

	sudo sed -i '/^\[/h;G;/Profile '"$2"'/s/\(Name=\).*/\1'"$7 $8"'/m;P;d'  /usr/local/etc/Nextion_Support/profiles.txt
	sudo sed -i '/^\[/h;G;/Profile '"$2"'/s/\(TalkGroup=\).*/\1'"$8"'/m;P;d'  /usr/local/etc/Nextion_Support/profiles.txt

	sudo sed -i '/^\[/h;G;/Profile 0/s/\(Address=\).*/\1'"$3"'/m;P;d'  /usr/local/etc/Nextion_Support/profiles.txt
	sudo sed -i '/^\[/h;G;/Profile 0/s/\(Mode=\).*/\1'"$4"'/m;P;d'  /usr/local/etc/Nextion_Support/profiles.txt
	sudo sed -i '/^\[/h;G;/Profile 0/s/\(Port=\).*/\1'"$5"'/m;P;d'  /usr/local/etc/Nextion_Support/profiles.txt
	sudo sed -i '/^\[/h;G;/Profile 0/s/\(Password=\).*/\1'"PWFILE"'/m;P;d'  /usr/local/etc/Nextion_Support/profiles.txt

	sudo sed -i '/^\[/h;G;/Profile 0/s/\(Name=\).*/\1'"$7 $8"'/m;P;d'  /usr/local/etc/Nextion_Support/profiles.txt
	sudo sed -i '/^\[/h;G;/Profile 0/s/\(TalkGroup=\).*/\1'"$8"'/m;P;d'  /usr/local/etc/Nextion_Support/profiles.txt
	
        pw1=$(echo "$3" | cut -d "." -f1)
        pw2=$(echo "$3" | cut -d "." -f3)

        if [ "$3" == tgif ] || [ "$3" == 127 ]; then
		sudo sed -i '/^\[/h;G;/Networks/s/\(TGIF=\).*/\1'"$6"'/m;P;d'  /home/pi-star/pwfile.txt
        fi

        if [ "$pw1" == mnet ]; then
		sudo sed -i '/^\[/h;G;/Networks/s/\(MNET=\).*/\1'"$6"'/m;P;d'  /home/pi-star/pwfile.txt
        fi
        if [ "$pw1" == brandmeister ]; then
		sudo sed -i '/^\[/h;G;/Networks/s/\(BM=\).*/\1'"$6"'/m;P;d'  /home/pi-star/pwfile.txt
        fi
    fi

fi;

