#!/bin/bash

# create notify title
title="Now Playing"

MPD_MUSIC_PATH="/home/$USER/Music"
TMP_COVER_PATH="/tmp/mpd-track-cover"

exiftool -b -Picture "$MPD_MUSIC_PATH/$(mpc --format "%file%" current)" > "$TMP_COVER_PATH"

# get current album
album=$(ncmpcpp --current-song={%b} 2> /dev/null)

# If album not null display cover

image="/tmp/mpd-track-cover"
notify-send -i $image "$title" "$(mpc current --format %artist%) - $(mpc current --format %title%)"

