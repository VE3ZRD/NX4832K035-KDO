############################################################
#  Get  Mode from /etc/mmdvmhost                           #
#  $1 1-6 Select Mode to get status of                     #
#                                                          #
#  Returns the status Enable=0 or 1                        #
#                                                          #
#  KF6S                                        09-01-2019  #
############################################################
#set -o errexit
#set -o pipefail
	m1=$(sed -nr "/^\[D-Star\]/ { :1 /^ModeHang[ ]*=/ { s/.*=[ ]*//; p; q;}; n; b 1;}" /etc/mmdvmhost)
	m2=$(sed -nr "/^\[D-Star Network\]/ { :1 /^ModeHang[ ]*=/ { s/.*=[ ]*//; p; q;}; n; b 1;}" /etc/mmdvmhost)
	m3=$(sed -nr "/^\[DMR\]/ { :1 /^ModeHang[ ]*=/ { s/.*=[ ]*//; p; q;}; n; b 1;}" /etc/mmdvmhost)
	m4=$(sed -nr "/^\[DMR Network\]/ { :1 /^ModeHang[ ]*=/ { s/.*=[ ]*//; p; q;}; n; b 1;}" /etc/mmdvmhost)

	m5=$(sed -nr "/^\[System Fusion\]/ { :1 /^ModeHang[ ]*=/ { s/.*=[ ]*//; p; q;}; n; b 1;}" /etc/mmdvmhost)
	m6=$(sed -nr "/^\[System Fusion Network\]/ { :1 /^ModeHang[ ]*=/ { s/.*=[ ]*//; p; q;}; n; b 1;}" /etc/mmdvmhost)

	m7=$(sed -nr "/^\[P25\]/ { :1 /^ModeHang[ ]*=/ { s/.*=[ ]*//; p; q;}; n; b 1;}" /etc/mmdvmhost)
	m8=$(sed -nr "/^\[P25 Network\]/ { :1 /^ModeHang[ ]*=/ { s/.*=[ ]*//; p; q;}; n; b 1;}" /etc/mmdvmhost)

	m9=$(sed -nr "/^\[NXDN\]/ { :1 /^ModeHang[ ]*=/ { s/.*=[ ]*//; p; q;}; n; b 1;}" /etc/mmdvmhost)
	m10=$(sed -nr "/^\[NXDN Network\]/ { :1 /^ModeHang[ ]*=/ { s/.*=[ ]*//; p; q;}; n; b 1;}" /etc/mmdvmhost)


mt="$m1|$m2|$m3|$m4|$m5|$m6|$m7|$m8|$m9|$m10"
echo "$mt"
