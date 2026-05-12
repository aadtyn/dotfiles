#!/usr/bin/env bash

# make sure it's executable with:
# chmod +x ~/.config/sketchybar/plugins/aerospace.sh

# Source colors from the config directory
source "$CONFIG_DIR/colors.sh"

# When called with FOCUSED_WORKSPACE env var (from aerospace event), update all workspaces
if [ -n "$FOCUSED_WORKSPACE" ]; then
    # This is called from aerospace event, update all workspaces
    for sid in $(aerospace list-workspaces --all); do
        if [ "$sid" = "$FOCUSED_WORKSPACE" ]; then
            sketchybar --set space.$sid background.drawing=on \
                                       background.color=$ACCENT_COLOR \
                                       label.color=$BAR_COLOR \
                                       icon.color=$BAR_COLOR
        else
            sketchybar --set space.$sid background.drawing=off \
                                       label.color=$ACCENT_COLOR \
                                       icon.color=$ACCENT_COLOR
        fi
    done
else
    # This is called for individual workspace (from spaces.sh), get focused workspace
    FOCUSED_WORKSPACE=$(aerospace list-workspaces --focused)
    
    if [ "$1" = "$FOCUSED_WORKSPACE" ]; then
        sketchybar --set $NAME background.drawing=on \
                             background.color=$ACCENT_COLOR \
                             label.color=$BAR_COLOR \
                             icon.color=$BAR_COLOR
    else
        sketchybar --set $NAME background.drawing=off \
                             label.color=$ACCENT_COLOR \
                             icon.color=$ACCENT_COLOR
    fi
fi