#!/usr/bin/awk -f

BEGIN {
	term = ENVIRON["TERM"]
	env  = "TMUTIL_COLOR"

	if ((term ~ "xterm*|rxvt*|gnome*|screen*|tmux*") || \
	   !(env in ENVIRON) || (ENVIRON[env] == "1"))
	{
		reset = "\033[0m"  ;    bold = "\033[1m"   ;  under = "\033[4m"
		  red = "\033[31m" ;   green = "\033[32m"  ; yellow = "\033[33m"
		 blue = "\033[34m" ; magenta = "\033[35m"  ;   cyan = "\033[36m"
		black = "\033[30m" ;    gray = "\033[38;5;8m"
		   up = "\033[3A"  ;    down = "\033[2B"
		clear = "\033[J"   ;   write = "\033[K"
	}
}
