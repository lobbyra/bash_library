###############################################
#          _       _               _          #
#         | |     | |             | |         #
#      ___| |_ ___| | ___ ___   __| | ___     #
#     / _ \ __/ _ \ |/ __/ _ \ / _` |/ _ \    #
#    |  __/ ||  __/ | (_| (_) | (_| |  __/    #
#    \___|\__\___|_|\___\___/ \__,_|\___|.fr  #
#                                             #
###############################################

# Bash snippet that generate a string.
# Credit to : https://unix.stackexchange.com/a/230676
#
# USAGE : passwd_gen

function passwd_gen () {
    if [[ ! $# -eq 1 ]] ; then
        echo 'passwd_gen need an argument'
        exit 1
    fi
    tr -dc 'A-Za-z0-9!"#$%&'\''()*+,-./:;<=>?@[\]^_`{|}~' </dev/urandom | head -c $1 ; echo
}

passwd_gen $1
