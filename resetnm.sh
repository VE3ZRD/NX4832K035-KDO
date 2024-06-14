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
sudo mmdvmhost.service restart

sudo mount -o remount,ro /

