source /etc/profile.env

set GPG_TTY (tty)

setxkbmap -layout us -option ctrl:nocaps

function mpctube
   if not pidof mpd > /dev/null
      mpd
   end
   mpc -q clear
   set url (youtube-dl -g $argv | tail -1)
   mpc -q add $url
   mpc -q play
end

# Aliases
alias sync="sudo layman -S; sudo emerge --sync"
alias dmacs="emacs --daemon"
alias xmacs="emacsclient -e '(kill-emacs)'"
alias tmacs="emacs -nw"
alias tcmacs="emacsclient -nw"
alias cmacs="emacsclient -n -c"
alias tor-browser="chromium --incognito --proxy-server='socks5://127.0.0.1:9050' 2>/dev/null &"

# Set Terminal Color
set TERM "xterm-256color"
set -gx PATH $PATH ~/.local/bin/
