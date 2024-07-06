#!/usr/bin/env sh

status=$(playerctl status 2>/dev/null)
artist=$(playerctl metadata --format "{{artist}}" 2>/dev/null)
title=$(playerctl metadata --format "{{title}}" 2>/dev/null)
album=$(playerctl metadata --format "{{album}}" 2>/dev/null)
artUrl=$(playerctl metadata --format "{{mpris:artUrl}}" 2>/dev/null)
length=$(playerctl metadata --format "{{duration(mpris:length)}}" 2>/dev/null)
shuffle=$(playerctl shuffle 2>/dev/null)
loop=$(playerctl loop 2>/dev/null)

echo "{
  \"status\": \"$status\",
  \"artist\": \"$artist\",
  \"title\": \"$title\",
  \"album\": \"$album\",
  \"artUrl\": \"$artUrl\",
  \"length\": \"$length\",
  \"shuffle\": \"$shuffle\",
  \"loop\": \"$loop\"
}"
