#!/usr/bin/env sh

volume=$(wpctl get-volume @DEFAULT_AUDIO_SINK@)
#todo fix 100% case

volume_value=$(echo $volume | cut -d':' -f2)

if [ $volume_value == "0.00" ]; then
  echo "0"
  exit 0
fi


if [[ $volume_value =~ ^" 1" ]]; then
  echo "${volume_value//.}"
  exit 0
fi

volume_percent=$(echo $volume_value | cut -d'.' -f2)

echo $volume_percent
