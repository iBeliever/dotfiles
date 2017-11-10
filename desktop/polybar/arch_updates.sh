#!/bin/bash

source ~/.config/colors

HAS_UDPATES_COLOR=$RED_5

pac=$(checkupdates 2> /dev/null | wc -l)
aur=$(cower -u 2> /dev/null | wc -l)

if [ $pac -gt 0 ] || [ $aur -gt 0 ]; then
    output="%{F$HAS_UDPATES_COLOR}%{F-}  "

    if [ $pac -gt 0 ]; then
        output+="$pac "
    fi

    if [ $aur -gt 0 ]; then
        output+="($aur)"
    fi

    echo $output
fi
