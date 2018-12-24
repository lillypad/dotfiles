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

.PHONY: install
.PHONY: uninstall

install: dirs install-x install-oh-my-fish install-vifm install-emacs install-i3 install-youtube-viewer install-conky install-scripts

dirs:
	mkdir -p ~/Music/ \
		~/Music/playlists/ \
		~/Tools/ \
		~/Downloads/ \
		~/Docs/ \
		~/Photos

install-x:
	cp home/xinitrc ~/.xinitrc

install-oh-my-fish:
	cp home/config/fish/config.fish ~/.config/fish/config.fish
	curl -s -L https://get.oh-my.fish | fish || echo
	fish -c "omf install lambda"

install-vifm:
	rm -rf ~/.config/vifm/colors/
	cp home/config/vifm/vifmrc ~/.config/vifm/vifmrc
	git clone https://github.com/vifm/vifm-colors ~/.config/vifm/colors

install-emacs:
	cp home/spacemacs ~/.spacemacs
	git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d
	emacs --batch -l ~/.emacs.d/init.el

install-i3:
	cp -r home/config/i3/. ~/.config/i3/

install-youtube-viewer:
	cp home/config/youtube-viewer/youtube-viewer.conf ~/.config/youtube-viewer/youtube-viewer.conf

install-conky:
	cp home/conkyrc ~/.conkyrc

install-fonts:
	git clone https://github.com/powerline/fonts.git /tmp/powerline-fonts/
	cd /tmp/powerline-fonts/ && \
		./install.sh
	rm -rf /tmp/powerline-fonts/

install-scripts:
	cd home/local/bin/ && \
		cp volume ~/.local/bin/volume

pull:
	@cp ~/.spacemacs home/spacemacs || echo "warning: spacemacs config missing update skipped..."
	@cp ~/.ncmpcpp/config home/ncmpcpp/config || echo "warning: ncmpcpp config missing update skipped..."
	@cp ~/.mpd/mpd.conf home/mpd/mpd.conf || echo "warning mpd config missing skipping..."
	@cp ~/.config/fish/config.fish home/config/fish/config.fish || echo "warning fish config missing update skipped..."
	@cp ~/.config/vifm/vifmrc home/config/vifm/vifmrc || echo "warning: vifm config missing update skipped..."
	@cp ~/.local/share/applications/mimeapps.list home/local/share/applications/mimeapps.list || echo "warning: mimeapps missing update skipped..."
	@cp -r ~/.config/i3/. home/config/i3/ || echo "warning: i3 missing update skipped..."
	@cp ~/.config/youtube-viewer/youtube-viewer.conf home/config/youtube-viewer/youtube-viewer.conf || echo "warning: youtube-viewer missing update skipped..."
	@cp ~/.xinitrc home/xinitrc || echo "warning: xinitrc missing skipping..."
	@cp ~/.conkyrc home/conkyrc || echo "warning: conky missing update skipped..."
	@cp ~/.local/bin/volume home/local/bin/volume || echo "warning: volume script missing update skipped..."

uninstall: uninstall-emacs uninstall-vifm uninstall-fish uninstall-youtube-viewer uninstall-x uninstall-conky uninstall-scripts

uninstall-emacs:
	rm -rf ~/.emacs.d/

uninstall-vifm:
	rm -rf ~/.config/vifm/vifm-colors/
	rm -f ~/.config/vifm/vifmrc

uninstall-fish:
	rm -f ~/.config/fish/config.fish

uninstall-youtube-viewer:
	rm -f ~/.config/youtube-viewer/youtube-viewer.conf

uninstall-x:
	rm -f ~/.xinitrc

uninstall-conky:
	rm -f ~/.conkyrc

uninstall-scripts:
	cd ~/.local/bin/ && \
		rm -f volume
