#!/bin/bash
############################################################
#  Reset Nextion Driver and MMDVMHost                      #
#  						           #
#  				                           #
#  VE3RD                                       2024-06-05  #
############################################################
set -o errexit
set -o pipefail
sudo mount -o remount,rw /
sudo nextiondriver.service restart
sleep 5
sudo mmdvmhost.service restart


