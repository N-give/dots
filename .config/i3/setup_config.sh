#! /bin/bash

cat ~/.config/i3/config.base > ~/.config/i3/config

if [ "$HOSTNAME" == "gon" ]; then
  cat ~/.config/i3/config.gon >> ~/.config/i3/config
fi
