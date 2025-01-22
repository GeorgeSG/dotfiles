#!/usr/bin/env sh

if [[ $(playerctl status) == "Playing" ]]; then
  playerctl pause
else
  playerctl play
fi
