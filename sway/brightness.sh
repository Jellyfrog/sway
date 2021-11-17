#!/usr/bin/env bash

SET="$1"
PERCENTAGE="$(brightnessctl --machine-readable set "$SET" | cut -d',' -f4 | cut -d'%' -f1)"

notify-send.sh --hint=int:value:"$PERCENTAGE" --expire-time=500 --replace-file="/tmp/notify_brightness" " Brightness: $PERCENTAGE%"
