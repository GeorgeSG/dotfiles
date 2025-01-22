#!/usr/bin/env sh

day=$(date "+%a")
date=$(date "+%-d")
time=$(date "+%H:%M")


JSON_STRING=$(jq -n \
                  --arg day "$day" \
                  --arg date "$date" \
                  --arg time "$time" \
                  '{day: $day, date: $date, time: $time}')

echo $JSON_STRING
