#!/bin/bash
##########################################################################
# Name: uareidiotwithtmux.bash
#
# run automatically by youareidiot.bash
#
# Usage: ./youareidioto.bash
#
# Author: Ryosuke Tomita
# Date: 2021/03/09
#########################################################################
#readonly dirpath="/home/tomita/bash/toy/uareidiot"

function changecolor()
{
    tput setab $1
    tput setaf $2
}


function runscript()
{
    let cnt++
    ./youareidiot.bash $cnt
}

function installLibrary()
{
    if type tmux > /dev/null 2>&1 ;then
        :
    else
        sudo apt install tmux
    fi

    if type sox > /dev/null 2>&1 ;then
        :
    else
        sudo apt install sox
        sudo apt install libsox-fmt-mp3
    fi
}
# main
installLibrary
declare -i cnt=$(cat record)
trap runscript EXIT

declare -i i=0 t=7 tmp

while true
do
    clear
    changecolor $i $t && echo -n " ☺  ☺  ☺ "
    echo -n -e "\n"
    if ps -e | grep play > /dev/null 2>&1; then
        :
    else
        play -q ./music/youareidiot.mp3 > /dev/null 2>&1 &
    fi
    sleep 1
    tmp=$i
    i=$t
    t=$tmp
done

