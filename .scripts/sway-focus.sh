#!/usr/bin/env bash

PROG=$( basename $0 )
target="$1"

swaymsg "[app_id=$target] focus" &> /dev/null
# could be Xwayland app:
swaymsg "[class=$target] focus" &> /dev/null
# not running yet?
pkill -0 $target || xcheck exec $target

