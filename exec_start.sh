#!/usr/bin/bash

export GTK_IM_MODULE=fcitx
export QT_IM_MODULE=fcitx
export XMODIFIERS=@im=fcitx
 
case $1 in
  1)
    [ -f /tmp/.X1-lock ] && rm -f /tmp/.X1-lock
    [ -f /tmp/.X11-unix/X1 ] && rm -f /tmp/.X11-unix/X1
    export DISPLAY=:1
    /usr/bin/tigervncserver \
      -geometry 2100x1800 \
      -depth 24 \
      -xstartup wmaker \
      -localhost no \
      :1
    fcitx &
    export XKL_XMODMAP_DISABLE=1
    autocutsel -fork 
    qbittorrent &
    x-terminal-emulator &
    nautilus &
    firefox &
    ;;
  2)
    [ -f /tmp/.X2-lock ] && rm -f /tmp/.X2-lock
    [ -f /tmp/.X11-unix/X2 ] && rm -f /tmp/.X11-unix/X2
    export DISPLAY=:2
    export XCURSOR_SIZE=72
    /usr/bin/tigervncserver \
      -geometry 3402x2730 \
      -depth 24 \
      -xstartup wmaker \
      -localhost no \
      :2
    fcitx &
    export XKL_XMODMAP_DISABLE=1
    autocutsel -fork 
    x-terminal-emulator &
    ;;
  *)
    echo "undefined display"
    exit 255;
    ;;
esac
