#!/bin/bash

get_media_info() {
    if osascript -e 'tell application "Spotify" to if it is running then player state as string' 2>/dev/null | grep -q "playing"; then
        local title=$(osascript -e 'tell application "Spotify" to name of current track' 2>/dev/null)
        local artist=$(osascript -e 'tell application "Spotify" to artist of current track' 2>/dev/null)
        if [[ -n "$title" && -n "$artist" ]]; then
            echo "playing|$title - $artist"
            return
        fi
    fi
    
    if osascript -e 'tell application "Music" to if it is running then player state as string' 2>/dev/null | grep -q "playing"; then
        local title=$(osascript -e 'tell application "Music" to name of current track' 2>/dev/null)
        local artist=$(osascript -e 'tell application "Music" to artist of current track' 2>/dev/null)
        if [[ -n "$title" && -n "$artist" ]]; then
            echo "playing|$title - $artist"
            return
        fi
    fi
    
    echo "stopped|"
}

if [ -z "$INFO" ]; then
    MEDIA_INFO=$(get_media_info)
else
    STATE="$(echo "$INFO" | jq -r '.state')"
    if [ "$STATE" = "playing" ]; then
        MEDIA="$(echo "$INFO" | jq -r '.title + " - " + .artist')"
        MEDIA_INFO="playing|$MEDIA"
    else
        MEDIA_INFO="stopped|"
    fi
fi

STATE=$(echo "$MEDIA_INFO" | cut -d'|' -f1)
MEDIA=$(echo "$MEDIA_INFO" | cut -d'|' -f2)

if [ "$STATE" = "playing" ] && [ -n "$MEDIA" ]; then
    sketchybar --set $NAME label="$MEDIA" drawing=on
else
    sketchybar --set $NAME drawing=off
fi
