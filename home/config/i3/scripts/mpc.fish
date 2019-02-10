#!/usr/bin/env fish

switch (echo -e "play\npause\nstop\nnext\nprev\nshuffle\nrandom\nvolup\nvoldown\nupdate" | dmenu -nb '#000000' -sf '#000000' -sb '#ffffff' -nf '#ffffff' -i -p "$1")
	case play
		mpc play > /dev/null
	case pause
		mpc pause  > /dev/null
	case stop
		mpc stop > /dev/null
	case next
		mpc next > /dev/null
	case prev
		mpc prev > /dev/null
	case shuffle
		mpc shuffle > /dev/null
	case random
		mpc random > /dev/null
	case volup
		mpc volume +10 > /dev/null
	case voldown
		mpc volume -10 > /dev/null
	case update
		mpc update > /dev/null
	case '*'
		exit 1
end
