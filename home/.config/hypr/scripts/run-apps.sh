#!/usr/bin/env sh

hyprctl dispatch -- exec '[workspace 1]' firefox &
hyprctl dispatch -- exec '[workspace 3 silent]' telegram-desktop &
sleep 1
hyprctl dispatch -- exec '[workspace 3 silent]' todoist &
sleep 1
hyprctl dispatch -- exec '[workspace 3 silent]' alacritty -e ~/Scripts/start-tmux &

tmux send -t default 'btop' ENTER;
