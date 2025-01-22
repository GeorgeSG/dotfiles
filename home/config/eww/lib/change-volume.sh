#!/usr/bin/env sh

if [[ $1 == "up" ]]; then
  wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+
elif [[ $1 == "down" ]]; then
  wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
else
  wpctl set-volume @DEFAULT_AUDIO_SINK@ $1
fi
