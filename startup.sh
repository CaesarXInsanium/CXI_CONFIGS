#!/bin/sh

 picom --experimental-backends &
 xfce4-screensaver &

gnome-keyring-daemon --start &
 nitrogen --restore &
