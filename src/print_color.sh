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

############################################################################
# This function make uses of color in the terminal easier.
#
# USAGE : print_color [color wanted] [your text] (type)
#
# /!\ If the number of arguments != 2 or 3 this function exit with status 1 code
# /!\ This function don't print final \n like echo, look at print_color_echo
#
# [color wanted] : The color wanted in lowercase
# [your text] : A string
# () : Optionnal argument if you want to apply a type
#           "bold" | "faint" | "italics" | "underlined"
#
# PC_ is for Print_Color, this prefix used to avoid existing variable access
############################################################################

export PC_printer="printf"

function print_color () {
    if [[ ! $# -eq 2 ]] && [[ ! $# -eq 3 ]] ; then       # Arg number protection
        echo 'USAGE print_color [color] [your string] (type)'
        exit 1
    fi

                                                        # Types initializations
    PC_bold="1;"; PC_faint="2;"; PC_italics="3;"; PC_underlined="4;"; 
    type_var="PC_"$3

                                                        # Colors initializations
    PC_black="30"; PC_red="31"; PC_green="32"; PC_yellow="33"; PC_blue="34";
    PC_magenta="35"; PC_cyan="36"; PC_gray="99"; PC_lightGray="37";
    PC_lightRed="91"; PC_lightGreen="92"; PC_lightYellow="93";
    PC_lightBlue="94"; PC_lightMagenta="95"; PC_lightCyan="96"; PC_white="97"
    color_var="PC_"$1

    PC_reset="\e[0m"
    final_color_code="\e[${!type_var}${!color_var}m"

    $PC_printer "$final_color_code$2$PC_reset"      # Final text printing
}

function print_color_echo () {
    PC_printer="echo -e"
    print_color $1 $2 $3
}

# print_color_echo $1 $2 $3
