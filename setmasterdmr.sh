#!/bin/bash
############################################################
#  Set DMR Master Parameters                                  #
#                                                          #
#  Enable "$1" = 1 Sets YSF2P25 Mode                       #
#                                                          #
#  VE3RD                                      2020-01-27   #
############################################################
set -o errexit
set -o pipefail
sudo mount -o remount,rw /

echo "$1|$2|$3|$4|$5|$6|$7" > /home/pi-star/ysf2p25.txt
m1=$(sed -nr "/^\[General\]/ { :1 /^Id[ ]*=/ { s/.*=[ ]*//; p; q;}; n; b 1;}" /etc/mmdvmhost)

sudo /usr/local/sbin/mmdvmhost.service stop  > /dev/null
sudo /usr/local/etc/Nextion_Support/clearallmodes.sh
p1="$1" ##dmr server address or 127.0.0.1 forDMRGateway
p2="$2" ## Port
p3="$3" ## TG

               sudo mount -o remount,rw /
                        echo "Clearing YSF Parameters"  >> /home/pi-star/ysf2dmr.log

                        ## Clear YSF Parameters
                        sudo sed -i '/\[Enabled\]/!b;n;cEnabled='"0"'' /etc/ysf2dmr
                        sudo sed -i '/^\[/h;G;/System Fusion/s/\(Enable=\).*/\10/m;P;d' /etc/mmdvmhost
                        sudo sed -i '/^\[/h;G;/YSF Network/s/\(Enabled=\).*/\10/m;P;d' /etc/ysfgateway
                        sudo sed -i '/^\[/h;G;/FCS Network/s/\(Enabled=\).*/\10/m;P;d' /etc/ysfgateway

                        ## Ser DMR Master  >> /home/pi-star/ysf2dmr.log

                        echo "Setting TGIF Parameters"  >> /home/pi-star/ysf2p25.log

                        sudo sed -i '/^\[/h;G;/DMR/s/\(Enable=\).*/\11/m;P;d' /etc/mmdvmhost
                        sudo sed -i '/^\[/h;G;/DMR Network/s/\(Enable=\).*/\11/m;P;d' /etc/mmdvmhost

                       sudo sed -i '/^\[/h;G;/DMR/s/\(^Id=\).*/\1'"$m1"'/m;P;d' /etc/mmdvmhost
                       sudo sed -i '/^\[/h;G;/DMR Network/s/\(Port=\).*/\1'"62031"'/m;P;d' /etc/mmdvmhost

                        if [ "$p1" == "127.0.0.1" ]; then
                                sudo sed -i '/^\[/h;G;/DMR Network/s/\(Address=\).*/\1'"127.0.0.1"'/m;P;d' /etc/mmdvmhost
                                sudo sed -i '/^\[/h;G;/DMR Network/s/\(Type=\).*/\1'"Gateway"'/m;P;d' /etc/mmdvmhost
                                sudo sed -i '/^\[/h;G;/DMR Network/s/\(LocalPort=\).*/\1'"62032"'/m;P;d' /etc/mmdvmhost
                                sudo dmrgateway.service restart
                                echo "Starting DMRGateway" >> /home/pi-star/ysf2p25.log
			else

                               sudo sed -i '/^\[/h;G;/DMR Network/s/\(Address=\).*/\1'"$p1"'/m;P;d' /etc/mmdvmhost
                                echo "Starting TGIF Server" >> /home/pi-star/ysf2p25.log
                                sudo sed -i '/^\[/h;G;/DMR Network/s/\(Type=\).*/\1'"Direct"'/m;P;d' /etc/mmdvmhost
                                sudo sed -i '/^\[/h;G;/DMR Network/s/\(LocalPort=\).*/\1'"62031"'/m;P;d' /etc/mmdvmhost

                        fi


sudo /usr/local/sbin/mmdvmhost.service start  > /dev/null

sudo mount -o remount,ro /
