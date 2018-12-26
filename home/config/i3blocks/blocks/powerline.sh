#!/usr/bin/env bash

FOREGROUND=$1
BACKGROUND=$2

echo -e "<span color='$FOREGROUND' bgcolor='$BACKGROUND'>\xee\x82\xb2</span><span color='$BACKGROUND' bgcolor='$FOREGROUND'>`$3`</span>"
