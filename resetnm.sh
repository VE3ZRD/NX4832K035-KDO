#!/bin/bash
############################################################
#  Reset Nextion Driver and MMDVMHost                      #
#  						           #
#  				                           #
#  VE3RD                                       2024-06-05  #
############################################################
set -o errexit
set -o pipefail

sudo nextiondriver.service restart
sudo mmdvmhost.service restart


