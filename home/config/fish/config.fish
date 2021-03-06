bass source /etc/profile

set GPG_TTY (tty)

function mpctube
   if not pidof mpd > /dev/null
      mpd
   end
   mpc -q clear
   set url (youtube-dl -g $argv | tail -1)
   mpc -q add $url
   mpc -q play
end

function mplayer-youtube
	set url (youtube-dl -f best -g $argv)
	nohup mplayer (youtube-dl -f best -g  $url) & disown (jobs -p | head -2) && exit
end

function weechat-tmux
	set -lx TERM tmux-256color
	weechat
end

function service-cupsd
	sudo /etc/init.d/cupsd $argv
end

function service-tor
	sudo /etc/init.d/tor $argv
end

function service-docker
	sudo /etc/init.d/docker $argv
end

function service-ofono
	sudo /etc/init.d/ofono $argv
end

# Aliases
alias shutdown="sudo shutdown -h now"
alias reboot="sudo reboot"
alias emerge="sudo emerge"
alias layman="sudo layman"
alias vbox="VBoxManage"
alias ls="lsd"
alias pcp="rsync --progress"
alias service="rc-service"
alias wifi-scan="sudo iwlist scan"
alias sync="layman -S; emerge --sync"
alias dmacs="emacs --daemon"
alias xmacs="emacsclient -e '(kill-emacs)'"
alias tmacs="emacs -nw"
alias tcmacs="emacsclient -nw"
alias cmacs="emacsclient -n -c"
alias tor-browser="chromium --incognito --proxy-server='socks5://127.0.0.1:9050' 2>/dev/null &"
alias weather="curl wttr.in"
# Set Terminal Color
set TERM "xterm-256color"
set -gx PATH $PATH ~/.local/bin/
