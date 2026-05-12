#!/bin/bash

# Create workspace items for all workspaces at startup (no individual subscriptions)
for sid in $(aerospace list-workspaces --all | sort -n); do
    sketchybar --add item space.$sid left \
        --set space.$sid \
        background.color=$BAR_COLOR \
        icon="$sid" \
        icon.padding_left=6 \
        icon.padding_right=6 \
        label.drawing=off \
        click_script="aerospace workspace $sid"
done

# Single event handler for all workspace changes
sketchybar --add item space_separator left \
           --set space_separator icon="􀆊" \
                                 icon.color=$ACCENT_COLOR \
                                 icon.padding_left=0 \
                                 label.drawing=off \
                                 background.drawing=off \
                                 background.color=$BAR_COLOR \
                                 script="$PLUGIN_DIR/space_windows.sh" \
           --subscribe space_separator aerospace_workspace_change                           
