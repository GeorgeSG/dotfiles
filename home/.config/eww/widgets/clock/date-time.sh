#!/usr/bin/env sh

DaySuffix() {
  case `date +%-d` in
    1|21|31) echo "st";;
    2|22)    echo "nd";;
    3|23)    echo "rd";;
    *)       echo "th";;
  esac
}

date=$(date "+%a, %b %-d`DaySuffix` · %H:%M")
printf "%s" "$date"
