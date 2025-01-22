#!/usr/bin/env sh

status=$(playerctl status 2>/dev/null)
artist=$(playerctl metadata -f "{{artist}}" 2>/dev/null)
title=$(playerctl metadata -f "{{title}}" 2>/dev/null)
album=$(playerctl metadata -f "{{album}}" 2>/dev/null)
artUrl=$(playerctl metadata -f "{{mpris:artUrl}}" 2>/dev/null)
length=$(playerctl metadata -f "{{duration(mpris:length)}}" 2>/dev/null)
shuffle=$(playerctl shuffle 2>/dev/null)
loop=$(playerctl loop 2>/dev/null)

JSON_STRING=$(jq -n \
                  --arg status "$status" \
                  --arg artist "$artist" \
                  --arg title "$title" \
                  --arg album "$album" \
                  --arg artUrl "$artUrl" \
                  --arg length "$length" \
                  --arg shuffle "$shuffle" \
                  --arg loop "$loop" \
                  '{status: $status, artist: $artist, title: $title, album: $album, artUrl: $artUrl, length: $length, shuffle: $shuffle, loop: $loop}')

echo $JSON_STRING
