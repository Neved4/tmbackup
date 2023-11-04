#!/bin/sh
set -Cefu

sudo -v
while true
do
	sudo -n true && sleep 60
	kill -0 "$$" || exit
done 2>/dev/null &
