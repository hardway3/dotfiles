#!/bin/bash

rofi_command="rofi -columns 3 -lines 1 -theme themes/layout-scrot.rasi"

# Each of the icon is a selectable element
options=$'\n\n'

chosen="$(echo "$options" | $rofi_command -font "Font Awesome 5 Pro Solid 50" -dmenu)"
case $chosen in
    ) # Tabbed mode
        i3-msg layout tabbed
        ;;
    ) # Split mode
        i3-msg layout toggle split
        ;;
    ) # Stacking mode
        i3-msg layout stacked
        ;;
esac

