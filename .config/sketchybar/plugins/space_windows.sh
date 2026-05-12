#!/bin/bash

source "$CONFIG_DIR/colors.sh"

FOCUSED=$(aerospace list-workspaces --focused 2>/dev/null)

args=()
for sid in $(aerospace list-workspaces --all 2>/dev/null); do
    if [ "$sid" = "$FOCUSED" ]; then
        args+=(--set "space.$sid" background.drawing=on background.color="$ACCENT_COLOR" icon.color="$BAR_COLOR")
    else
        args+=(--set "space.$sid" background.drawing=off icon.color="$ACCENT_COLOR")
    fi
done

[ ${#args[@]} -gt 0 ] && sketchybar "${args[@]}"
