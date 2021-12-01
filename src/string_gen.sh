#!/bin/bash
###############################################
#          _       _               _          #
#         | |     | |             | |         #
#      ___| |_ ___| | ___ ___   __| | ___     #
#     / _ \ __/ _ \ |/ __/ _ \ / _` |/ _ \    #
#    |  __/ ||  __/ | (_| (_) | (_| |  __/    #
#    \___|\__\___|_|\___\___/ \__,_|\___|.fr  #
#                                             #
###############################################

#####################################################################
# Bash snippet that generate an alphanum string with a custom length.
# Credit to : https://unix.stackexchange.com/a/230676
#
# USAGE : passwd_gen [length of wanted string]
#####################################################################

function string_gen () {
    if [[ ! $# -eq 1 ]] ; then
        echo 'string_gen need an argument'
        exit 1
    fi
    tr -dc A-Za-z0-9 < /dev/urandom | head -c $1 ; echo ''
}

# Uncomment this to test with bash
# string_gen $1
