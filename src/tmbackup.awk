#!/usr/bin/awk -f

BEGIN {
	FS     = ": "
	black = "\033[0m"
	red   = "\033[31m"
	green = "\033[32m"
}

function backup() {
	if (mount == "") {
		printf("Skipping...   " red "%s" black " (%s)\n", id, name)
	} else {
		printf("Backing up... " green "%s" black " (%s)\n", id, name)
		system("sudo tmutil startbackup -br -d \"" id "\"")
	}
}

/Name/ { name=$2 }
/ID/ { id = $2 }
/Mount Point/ { mount = $2 }
/====/ && name && id {
	backup()
	name = id = mount = copied = speed = ""
	printf("\n")
}

END {
	if (name && id) {
		backup()
		printf("\n")
	}
}
