#!/usr/bin/env sh

grim -g "$(slurp -o)" - | wl-copy
