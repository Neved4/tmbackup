#!/bin/sh
set -Cefu

backup() {
	tmutil destinationinfo | awk '/^ID/ {print $NF}' |
		while read -r id
		do
			sudo tmutil startbackup -br -d "$id"
		done
}
