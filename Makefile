# dotfiles - Makefile Copyright (C) 2018  Lilly Chalupowski

# This program is free software: you can redistribute it and/or modify
# it under the terms of the GNU General Public License as published by
# the Free Software Foundation, either version 3 of the License, or
# 3(at your option) any later version.

# This program is distributed in the hope that it will be useful,
# but WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
# GNU General Public License for more details.

# You should have received a copy of the GNU General Public License
# along with this program.  If not, see <https://www.gnu.org/licenses/>.

CWD=$(shell pwd)

.PHONY: clean
.PHONY: build
.PHONY: install
.PHONY: uninstall

clean: clean-st

build: build-st

install: dirs \
	install-st \
	install-fish \
	install-vifm \
	install-youtube-viewer \
	install-emacs \
	install-mpd \
	install-ncmpcpp \
	install-i3 \
	install-i3blocks \
	install-conky \
	install-neomutt \
	install-mc \
	install-mplayer \
	install-transmission-daemon

uninstall: uninstall-st \
	uninstall-fish \
	uninstall-vifm \
	uninstall-youtube-viewer \
	uninstall-emacs \
	uninstall-mpd \
	uninstall-ncmpcpp \
	uninstall-i3 \
	uninstall-i3blocks \
	uninstall-conky \
	uninstall-neomutt \
	uninstall-mc \
	uninstall-mplayer \
	uninstall-transmission-daemon

dirs:
	mkdir -p ~/Music/ \
		~/Music/playlists/ \
		~/Tools/ \
		~/Downloads/ \
		~/Docs/ \
		~/Photos

build-st:
	cd src/st/ && \
		make

clean-st:
	cd src/st/ && \
		make clean

install-st:
	mkdir -p ~/.local/bin/
	cp src/st/st ~/.local/bin/

uninstall-st:
	rm -f ~/.local/bin/st

install-quicklisp:
	curl -s --output ~/quicklisp.lisp "https://beta.quicklisp.org/quicklisp.lisp"
	@echo "|---------------------------------|"
	@echo "|  RUN THESE COMMANDS TO INSTALL  |"
	@echo "|---------------------------------|"
	@echo "| (quicklisp-quickstart:install)  |"
	@echo "|      (ql:add-to-init-file)      |"
	@echo "|---------------------------------|"
	sbcl --load ~/quicklisp.lisp
	rm -f ~/quicklisp.lisp

uninstall-quicklisp:
	rm -rf ~/quicklisp/

install-x:
	cp home/xinitrc ~/.xinitrc

install-fish:
	mkdir -p ~/.config/fish/
	ln -f -s ${CWD}/home/config/fish/config.fish ~/.config/fish/config.fish
	curl -s -L https://get.oh-my.fish | fish || echo
	fish -c "omf install lambda"
	fish -c "set fish_greeting"

uninstall-fish:
	rm -f ~/.config/fish/config.fish
	rm -rf ~/.config/fish/
	rm -rf ~/.local/share/fish/
	rm -rf ~/.local/share/omf/

install-vifm:
	mkdir -p ~/.config/vifm/
	rm -rf ~/.config/vifm/colors/
	ln -f -s ${CWD}/home/config/vifm/vifmrc ~/.config/vifm/vifmrc
	git clone https://github.com/vifm/vifm-colors ~/.config/vifm/colors

uninstall-vifm:
	rm -f ~/.config/vifm/vifmrc
	rm -rf ~/.config/vifm/

install-emacs:
	ln -f -s ${CWD}/home/spacemacs ~/.spacemacs
	git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
	cd ~/.emacs.d/ && \
		git checkout develop
	cd ~
	emacs --batch -l ~/.emacs.d/init.el

uninstall-emacs:
	rm -f ~/.spacemacs
	rm -rf ~/.emacs.d/

install-i3:
	ln -f -s ${CWD}/home/config/i3/ ~/.config/i3

uninstall-i3:
	rm -f ~/.config/i3

install-youtube-viewer:
	ln -f -s ${CWD}/home/config/youtube-viewer/ ~/.config/youtube-viewer

uninstall-youtube-viewer:
	rm -f ~/.config/youtube-viewer

install-mplayer:
	ln -s ${CWD}/home/mplayer/ ~/.mplayer

uninstall-mplayer:
	rm -f ~/.mplayer

install-conky:
	ln -f -s ${CWD}/home/conkyrc ~/.conkyrc

uninstall-conky:
	rm -f ~/.conkyrc

install-transmission-daemon:
	ln -f -s ${CWD}/home/config/transmission-daemon/ ~/.config/transmission-daemon

uninstall-transmission-daemon:
	rm -f ~/.config/transmission-daemon

install-fonts:
	git clone https://github.com/powerline/fonts.git /tmp/powerline-fonts/
	cd /tmp/powerline-fonts/ && \
		./install.sh
	rm -rf /tmp/powerline-fonts/

install-bin:
	mkdir -p ~/.local/bin/
	cp -r home/local/bin/. ~/.local/bin/

uninstall-bin:
	cd ~/.local/bin/ && \
		rm -f volume &&
		rm -f lsd

install-i3blocks:
	ln -f -s ${CWD}/home/config/i3blocks/ ~/.config/i3blocks

uninstall-i3blocks:
	rm -f ~/.config/i3blocks/

install-ncmpcpp:
	ln -f -s ${CWD}/home/ncmpcpp/ ~/.ncmpcpp

uninstall-ncmpcpp:
	rm -f ~/.ncmpcpp

install-mpd:
	ln -f -s ${CWD}/home/mpd/ ~/.mpd

uninstall-mpd:
	rm -f ~/.mpd

install-neomutt:
	ln -f -s ${CWD}/home/config/neomutt/ ~/.config/neomutt

install-mc:
	ln -f -s ${CWD}/home/config/mc/ ~/.config/mc

uninstall-mc:
	rm -f ~/.config/mc

install-kernel:
	cp usr/src/linux/config /usr/src/linux/.config
