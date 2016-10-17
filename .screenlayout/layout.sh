#!/bin/bash

DISP_NUM="$(xrandr | grep "\Wconnected" | wc -l)"
echo $DISP_NUM

if [[ $DISP_NUM == 1 ]]; then
    ~/.screenlayout/only-notebook.sh
else
    ~/.screenlayout/notebook-and-monitor.sh
fi

feh --bg-scale ~/.img/wallpaper*
