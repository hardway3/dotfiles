#!/bin/bash
# Description: Check pacman updates.

#. $HOME/.local/bin/color-parser

pac=$(checkupdates | wc -l)

#aur=$(cower -u | wc -l)
aur=$(yay -Qau | wc -l)

if [[ -n "$pac" ]];then
        echo "$aur  $pac"
else
        echo " %{F#BYELLOW} " " 0 %{F-}"
fi
