#!/bin/sh

while true; do
	dwm 2> "$HOME/.local/share/dwm/dwm.log"
done &

[ -f '/etc/gentoo-release' ] && gentoo-pipewire-launcher &

sleep 1
"$HOME/scripts/dwm/fcitx.sh"
while true
