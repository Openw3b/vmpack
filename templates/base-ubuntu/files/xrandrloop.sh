#!/bin/sh

xrandr --output "$(xrandr | awk '/ connected/{print $1; exit; }')" --auto

xev -root -event randr | \
grep --line-buffered 'subtype XRROutputChangeNotifyEvent' | \
while read foo ; do \
    xrandr --output "$(xrandr | awk '/ connected/{print $1; exit; }')" --auto
done
