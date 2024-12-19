#!/bin/sh

while true; do
	xsetroot -name "($(date +%a)) $(date +%c)"
	#xsetroot -name "Vol.: $(pulsemixer --get-volume)   Date: ($(date +%a)) $(date +%c)"
	sleep 1
done
