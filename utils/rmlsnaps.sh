#!/bin/sh
set -Cefu

getlsnaps() {
	tmutil listlocalsnapshotdates | grep "-"
}

rmlsnaps() {
	lsnaps="$(getlsnaps)"

	for i in $lsnaps
	do
		tmutil deletelocalsnapshots "$i"
	done
}

rmlsnaps
