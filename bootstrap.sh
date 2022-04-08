#!/usr/bin/env bash

cd "$(dirname "${BASH_SOURCE}")"

git pull origin master

function syncDotfiles() {
	rsync --exclude ".git/" \
		--exclude ".DS_Store" \
		--exclude "README.md" \
		--exclude "macos.sh" \
		--exclude "bootstrap.sh" \
		--exclude "iterm.sh" \
		--exclude "oh-my-zsh.sh" \
		--exclude "brew.sh" \
		--exclude "Brewfile" \
		--exclude "Solarized Dark (Modified).itermcolors" \
		-avh --no-perms . ~;
}

if [ "$1" == "--force" -o "$1" == "-f" ]; then
	syncDotfiles
else
	read -p "This may overwrite existing files in your home directory. Are you sure? (y/n) " -n 1
	echo ""
	if [[ $REPLY =~ ^[Yy]$ ]]; then
		syncDotfiles
	fi;
fi;

unset syncDotfiles

echo "Setting up brew and installing dependencies"
./brew.sh

echo "Setting up macOS config"
./macos.sh

echo "Setting up oh-my-zsh"
./oh-my-zsh.sh

echo "Installing asdf plugins and packages"
./asdf.sh

echo "Setting up iTerm2"
./iterm.sh

echo "Setting up divvy sources"
./divvy.sh

source ~/.zshrc
