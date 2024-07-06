#!/usr/bin/env sh

case $1 in
    up)
        ddcutil -d 1 setvcp 10 $(($2 + 10))
        ;;
    down)
        ddcutil -d 1 setvcp 10 $(($2 - 10))
        ;;
esac
