config:
	mkdir -p ~/Music
	mkdir -p ~/Music/playlists
	mkdir -p ~/Tools
	mkdir -p ~/Downloads
	mkdir -p ~/Docs
	mkdir -p ~/Photos
	curl -s -L https://get.oh-my.fish | fish
	fish -c "omf install lambda"
	git clone https://github.com/syl20bnr/spacemacs ~/.emacs.d

update:
	cp ~/.spacemacs home/spacemacs | echo "warning: spacemacs config missing update skipped..."
	cp ~/.ncmpcpp/config home/ncmpcpp/config | echo "warning: ncmpcpp config missing update skipped..."
	cp ~/.mpd/mpd.conf home/mpd/mpd.conf | echo "warning mpd config missing skipping..."
	cp ~/.config/fish/config.fish home/config/fish/config.fish | echo "warning fish config missing update skipped..."

install:
	chsh -s /bin/fish
