#!/bin/bash
if [ $$ != `pgrep -fo $0` ]; then
  echo "Already running!" >&2
  exit 1
fi

python3 $XDG_CONFIG_HOME/waybar/nowplaying.py

exit 0
