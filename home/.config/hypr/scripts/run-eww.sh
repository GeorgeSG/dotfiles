#!/usr/bin/env sh

function reload_eww() {
  monitor_count=$(hyprctl monitors -j | jq length)
  monitor_names_str=$(hyprctl monitors -j | jq -r '.[].name')
  monitor_names=(${monitor_names_str// / })

  eww close-all
  sleep 1

  if [[ $monitor_count == 2 ]]; then
    if [[ ${monitor_names[0]} == "DP-1" ]]; then
      eww open bar --id bar1 --arg monitor=0 --arg monitor-workspaces="[1,2]"
      eww open bar --id bar2 --arg monitor=1 --arg monitor-workspaces="[3,4]"
      eww open monitor-bump --arg monitor=1
    elif [[ ${monitor_names[0]} == "DP-2" ]]; then
      eww open bar --id bar2 --arg monitor=0 --arg monitor-workspaces="[3,4]"
      eww open bar --id bar1 --arg monitor=1 --arg monitor-workspaces="[1,2]"
      eww open monitor-bump --arg monitor=0
    fi

  elif [[ ${monitor_names[0]} == "DP-1" ]]; then
    eww open bar --id bar1 --arg monitor=0 --arg monitor-workspaces="[1,2,3,4]"
  elif [[ ${monitor_names[0]} == "DP-2" ]]; then
    eww open bar --id bar1 --arg monitor=0 --arg monitor-workspaces="[1,2,3,4]"
    eww open monitor-bump --arg monitor=0
  fi

}

reload_eww

socat -u UNIX-CONNECT:$XDG_RUNTIME_DIR/hypr/$HYPRLAND_INSTANCE_SIGNATURE/.socket2.sock - | while read -r line; do
  if [[ $line =~ "monitorremoved" || $line =~ "monitoradded" ]]; then
    reload_eww
  fi
done
