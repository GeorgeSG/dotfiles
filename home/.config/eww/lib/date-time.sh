#!/usr/bin/env sh

DaySuffix() {
  case `date +%-d` in
    1|21|31) echo "st";;
    2|22)    echo "nd";;
    3|23)    echo "rd";;
    *)       echo "th";;
  esac
}

day=$(date "+%a")
date=$(date "+%-d")
time=$(date "+%H:%M")

echo "{\"date\": \"$date\", \"day\": \"$day\", \"time\": \"$time\"}"
