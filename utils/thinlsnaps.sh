#!/bin/sh
set -Cefu

thinlsnaps() {
	calc=$(echo "5 * 1000000000" | bc)

	tmutil thinlocalsnapshots / "$calc" 2
}

thinlsnaps
