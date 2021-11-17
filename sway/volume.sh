#!/usr/bin/env bash

SET="$1"
PERCENTAGE="$(pulsemixer --unmute --change-volume "$SET" --get-volume | cut -d' ' -f1)"

notify-send.sh --hint=int:value:"$PERCENTAGE" --expire-time=500 --replace-file="/tmp/notify_volume" " Volume: $PERCENTAGE%"
