#!/bin/bash
############################################################
#  Get  Location from /etc/mmdvmhost                       #
#                                                          #
#                                                          #
#  Returns the Location from mmdvmhost                     #
#                                                          #
#  EA7KDO                                      06-08-2021  #
############################################################
set -o errexit
set -o pipefail

sed -n '/^[ \t]*\[Info\]/,/\[/s/^[ \t]*Location[ \t]*=[ \t]*//p' /etc/mmdvmhost
