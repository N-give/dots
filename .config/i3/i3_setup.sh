#! /bin/bash

cat ~/.config/i3/config.base > ~/.config/i3/config

if [ "$HOSTNAME" == "gon" ]; then
  cat ~/.config/i3/config.gon >> ~/.config/i3/config
  # feh --bg-scale ~/Pictures/debian_wallpaper.png
elif [ "$HOSTNAME" == "saitama" ]; then
  cat ~/.config/i3/config.saitama >> ~/.config/i3/config
  xrandr --output HDMI-0 --left-of DP-0
  feh --bg-fill ~/Pictures/debian_wallpaper.png
elif [ "$HOSTNAME" == "ngivens-OptiPlex-7020" ]; then
  # xrandr --output DVI-0 --left-of DisplayPort-0
  xrandr --output DisplayPort-0 --right-of DVI-0
  cat ~/.config/i3/config.other >> ~/.config/i3/config
  feh --bg-scale ~/Pictures/solarized-wallpaper-ubuntu.png
else
  cat ~/.config/i3/config.other >> ~/.config/i3/config
  feh --bg-scale ~/Pictures/rand_pic.png
fi

