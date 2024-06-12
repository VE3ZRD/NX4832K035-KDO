#!/bin/bash
############################################################
#  Apply Selected Profile				   #
#                                                          #
#  VE3RD                                        2024-05-05 #
############################################################
set -o errexit
set -o pipefail
# Use passed DMR Master if present or default to TGIF if missing

#dirn="/usr/local/etc/Nextion_Support/profiles.txt"
dirn=etc/profiles.txt


sudo mount -o remount,rw /
pnum="$1"
sudo /usr/local/etc/Nextion_Support/clearallmodes.sh

 	m1=$(sed -nr "/^\[Profile "$pnum"\]/ { :l /^RXOffset[ ]*=/ { s/.*=[ ]*//; p; q;}; n; b l;}" $dirn)
  	m2=$(sed -nr "/^\[Profile "$pnum"\]/ { :l /^TXOffset[ ]*=/ { s/.*=[ ]*//; p; q;}; n; b l;}" $dirn)
  	m3=$(sed -nr "/^\[Profile "$pnum"\]/ { :l /^RXFrequency[ ]*=/ { s/.*=[ ]*//; p; q;}; n; b l;}" $dirn)
   	m4=$(sed -nr "/^\[Profile "$pnum"\]/ { :l /^TXFrequency[ ]*=/ { s/.*=[ ]*//; p; q;}; n; b l;}" $dirn)
 	m5=$(sed -nr "/^\[Profile "$pnum"\]/ { :l /^Callsign[ ]*=/ { s/.*=[ ]*//; p; q;}; n; b l;}" $dirn)
 	m6=$(sed -nr "/^\[Profile "$pnum"\]/ { :l /^Id[ ]*=/ { s/.*=[ ]*//; p; q;}; n; b l;}" $dirn)
#
  	m7=$(sed -nr "/^\[Profile "$pnum"\]/ { :l /^Address[ ]*=/ { s/.*=[ ]*//; p; q;}; n; b l;}" $dirn)
  	m8=$(sed -nr "/^\[Profile "$pnum"\]/ { :l /^Mode[ ]*=/ { s/.*=[ ]*//; p; q;}; n; b l;}" $dirn)
 	m9=$(sed -nr "/^\[Profile "$pnum"\]/ { :l /^Port[ ]*=/ { s/.*=[ ]*//; p; q;}; n; b l;}" $dirn)
    #            m10=$(sed -nr "/^\[Profile "$pnum"\]/ { :l /^Password[ ]*=/ { s/.*=[ ]*//; p; q;}; n; b l;}" $dirn)
  	m11=$(sed -nr "/^\[Profile "$pnum"\]/ { :l /^Name[ ]*=/ { s/.*=[ ]*//; p; q;}; n; b l;}" $dirn)
        m12=$(sed -nr "/^\[Profile "$pnum"\]/ { :l /^TalkGroup[ ]*=/ { s/.*=[ ]*//; p; q;}; n; b l;}" $dirn)

sudo sed -i '/^\[/h;G;/LastProfile/s/\(LPNum=\).*/\1'"$pnum"'/m;P;d'  $dirn

sudo sed -i '/^\[/h;G;/Profile 0/s/\(TXOffset=\).*/\1'"$m2"'/m;P;d'  $dirn
sudo sed -i '/^\[/h;G;/Profile 0/s/\(RXFrequency=\).*/\1'"$m3"'/m;P;d'  $dirn
sudo sed -i '/^\[/h;G;/Profile 0/s/\(TXFrequency=\).*/\1'"$m4"'/m;P;d'  $dirn
sudo sed -i '/^\[/h;G;/Profile 0/s/\(Callsign=\).*/\1'"$m5"'/m;P;d'  $dirn
sudo sed -i '/^\[/h;G;/Profile 0/s/\(Id=\).*/\1'"$m6"'/m;P;d'  $dirn

sudo sed -i '/^\[/h;G;/Profile 0/s/\(Address=\).*/\1'"$m7"'/m;P;d'  $dirn
sudo sed -i '/^\[/h;G;/Profile 0/s/\(Mode=\).*/\1'"$m8"'/m;P;d'  $dirn
sudo sed -i '/^\[/h;G;/Profile 0/s/\(Port=\).*/\1'"$m9"'/m;P;d'  $dirn
##### #sudo sed -i '/^\[/h;G;/Profile 0/s/\(Password=\).*/\1'"$m10"'/m;P;d'  $dirn
sudo sed -i '/^\[/h;G;/Profile 0/s/\(Name=\).*/\1'"$m11"'/m;P;d'  $dirn
sudo sed -i '/^\[/h;G;/Profile 0/s/\(TalkGroup=\).*/\1'"$m12"'/m;P;d'  $dirn


# Set MMDVM Profile Parameters
sudo sed -i '/^\[/h;G;/Modem/s/\(RXOffset=\).*/\1'"$m1"'/m;P;d'  /etc/mmdvmhost
sudo sed -i '/^\[/h;G;/Modem/s/\(TXOffset=\).*/\1'"$m2"'/m;P;d'  /etc/mmdvmhost
sudo sed -i '/^\[/h;G;/Info/s/\(RXFrequency=\).*/\1'"$m3"'/m;P;d'  /etc/mmdvmhost
sudo sed -i '/^\[/h;G;/Info/s/\(TXFrequency=\).*/\1'"$m4"'/m;P;d'  /etc/mmdvmhost
sudo sed -i '/^\[/h;G;/General/s/\(Callsign=\).*/\1'"$m5"'/m;P;d'  /etc/mmdvmhost
sudo sed -i '/^\[/h;G;/General/s/\(Id=\).*/\1'"$m6"'/m;P;d'  /etc/mmdvmhost

#DMR

t1=$(echo "$m7" | cut -d "." -f 1)
t2=$(echo "$m7" | cut -d "." -f 1)


        if [ "$t1" == 127 ]; then
		sudo sed -i '/^\[/h;G;/DMR/s/\(Enable=\).*/\11/m;P;d'  /etc/mmdvmhost
		sudo sed -i '/^\[/h;G;/DMR Network/s/\(Enable=\).*/\11/m;P;d'  /etc/mmdvmhost
		sudo sed -i '/^\[/h;G;/DMR Network/s/\(Address=\).*/\1'"$m7"'/m;P;d'  /etc/mmdvmhost
		sudo sed -i '/^\[/h;G;/DMR Network/s/\(Type=\).*/\1'"Gateway"'/m;P;d'  /etc/mmdvmhost
                m4=$(sed -nr "/^\[Networks\]/ { :l /^TGIF[ ]*=/ { s/.*=[ ]*//; p; q;}; n; b l;}" $pwf)
		sudo sed -i '/^\[/h;G;/Info/s/\(RXFrequency=\).*/\1'"$m3"'/m;P;d'  /etc/dmrgateway
		sudo sed -i '/^\[/h;G;/Info/s/\(TXFrequency=\).*/\1'"$m4"'/m;P;d'  /etc/dmrgateway

		dmrgateway.service restart
        fi

        if [ "$t1" == tgif ]; then
		sudo sed -i '/^\[/h;G;/DMR/s/\(Enable=\).*/\11/m;P;d'  /etc/mmdvmhost
		sudo sed -i '/^\[/h;G;/DMR Network/s/\(Enable=\).*/\11/m;P;d'  /etc/mmdvmhost
		sudo sed -i '/^\[/h;G;/DMR Network/s/\(Address=\).*/\1'"$m7"'/m;P;d'  /etc/mmdvmhost

                m4=$(sed -nr "/^\[Networks\]/ { :l /^TGIF[ ]*=/ { s/.*=[ ]*//; p; q;}; n; b l;}" /home/pi-star/pwfile.txt)
		sudo sed -i '/^\[/h;G;/DMR Network/s/\(Password=\).*/\1'"$m4"'/m;P;d'  /etc/mmdvmhost
		sudo sed -i '/^\[/h;G;/DMR Network/s/\(Type=\).*/\1'"Direct"'/m;P;d'  /etc/mmdvmhost
        fi

        if [ "$1" == mnet ]; then
                m4=$(sed -nr "/^\[Networks\]/ { :l /^MNET[ ]*=/ { s/.*=[ ]*//; p; q;}; n; b l;}" $pwf)
        fi
        if [ "$2" == brandmeister ]; then
                m4=$(sed -nr "/^\[Networks\]/ { :l /^BM[ ]*=/ { s/.*=[ ]*//; p; q;}; n; b l;}" $pwf)
        fi

	sudo sed -i '/^\[/h;G;/DMR Network/s/\(Password=\).*/\1'"$m7"'/m;P;d'  /etc/mmdvmhost

m8=$(sed -nr "/^\[Profile 0\]/ { :l /^Mode[ ]*=/ { s/.*=[ ]*//; p; q;}; n; b l;}" $dirn)
echo "Mode=$m8"

if [ "$m8" == YSF2DMR ]; then
	sudo /usr/local/etc/Nextion_Support/setysf2dmr.sh 1 1 tgif.network 31665 1 0
fi
if [ "$m8" == YSF2NXDN ]; then
	sudo /usr/local/etc/Nextion_Support/setysf2nxdn.sh 1 "$m12"
fi
if [ "$m8" == YSF2P25 ]; then
	sudo /usr/local/etc/Nextion_Support/setysf2p25.sh 1 "$m12" "$m7" "$m9" 
fi
#
if [ "$m8" == DMR ]; then
	sudo /usr/local/etc/Nextion_Support/setmasterdmr "$m7"
fi
#
if [ "$m8" == DMRG ]; then
	sudo /usr/local/etc/Nextion_Support/setmasterdmr.sh 127.0.0.1
fi
if [ "$m8" == DMR2YSF ]; then
	echo "Running setdmr2ysf.sh 1 1"
	sudo /usr/local/etc/Nextion_Support/setdmr2ysf.sh 0 1
fi
if [ "$m8" == DMR2YSF-G ]; then
	echo "Running setdmr2ysf.sh 1 1"
	sudo /usr/local/etc/Nextion_Support/setdmr2ysf.sh 1 1
fi
if [ "$m8" == DMR2NXDN ]; then
	sudo /usr/local/etc/Nextion_Support/setdmr2nxdn.sh 1 1
	echo "Running setdmr2nxdn.sh 0 1 "
fi
if [ "$m8" == DMR2NXDN-G ]; then
	sudo /usr/local/etc/Nextion_Support/setdmr2nxdn.sh 1 1
	echo "Running setdmr2nxdn.sh 1 1 "
fi
#
if [ "$m8" == YSF ]; then
sudo sed -i '/^\[/h;G;/System Fusion/s/\(Enable=\).*/\11/m;P;d'  /etc/mmdvmhost
sudo sed -i '/^\[/h;G;/System Fusion Network/s/\(Enable=\).*/\11/m;P;d'  /etc/mmdvmhost
fi
#
if [ "$m8" == NXDN ]; then
sudo sed -i '/^\[/h;G;/NXDN/s/\(Enable=\).*/\11/m;P;d'  /etc/mmdvmhost
sudo sed -i '/^\[/h;G;/NXDN Network/s/\(Enable=\).*/\11/m;P;d'  /etc/mmdvmhost
fi
#
if [ "$m8" == P25 ]; then
sudo sed -i '/^\[/h;G;/P25/s/\(Enable=\).*/\11/m;P;d'  /etc/mmdvmhost
sudo sed -i '/^\[/h;G;/P25 Network/s/\(Enable=\).*/\11/m;P;d'  /etc/mmdvmhost
fi
#
if [ "$m8" == POSAG ]; then
sudo sed -i '/^\[/h;G;/POCSAG/s/\(Enable=\).*/\11/m;P;d'  /etc/mmdvmhost
sudo sed -i '/^\[/h;G;/POCSAG Network/s/\(Enable=\).*/\11/m;P;d'  /etc/mmdvmhost
fi


dmrgateway.service restart

mmdvmhost.service restart
nextiondriver.service restart

sudo mount -o remount,ro /