#!/usr/bin/env bash

command="$1"

case $command in
    monitor)
        grim -g "$(swaymsg -t get_tree | jq -r '.. | (.nodes? // empty )[] | select(.focused==true) |.rect | "\(.x),\(.y) \(.width)x\(.height)"')" - | tee "$(xdg-user-dir PICTURES)/screenshot_$(date +'%Y-%m-%d-%H%M%S.png')" | wl-copy
        ;;
    region)
        #grim -g "$(slurp)" - | tee "$(xdg-user-dir PICTURES)/screenshot_$(date +'%Y-%m-%d-%H%M%S.png')" | wl-copy
        grim -g "$(slurp)" - | swappy -f - -o - | tee "$(xdg-user-dir PICTURES)/screenshot_$(date +'%Y-%m-%d-%H%M%S.png')" | wl-copy
        ;;
    *)
        echo "Unknown command"
        exit 1
        ;;
esac
