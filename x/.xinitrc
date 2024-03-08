#! /bin/bash

fcitx5 &

xmodmap "$HOME/.Xmodmap"

exec bspwm
