#!/usr/bin/env bash

MUSIC_DIR=~/Music

ART_DIR=$MUSIC_DIR/$(dirname "`mpc status -f '%file%' | head -n 1`")

ALBUM_ART=$(find "${ART_DIR}" -maxdepth 1 -type f -iregex ".*/.*\(${album}\|cover\|folder\|artwork\|front\).*[.]\(jpe?g\|png\|gif\|bmp\)" | head -n 1)

if [ ! -z "${ALBUM_ART}" ]; then
    convert -resize 128x128 "${ALBUM_ART}" /tmp/cover.png;
    notify-send "Now Playing" "`mpc status | head -n 1`" --hint=int:transient:1 -i /tmp/cover.png;
else
    notify-send "Now Playing" "`mpc status | head -n 1`" --hint=int:transient:1;
fi
