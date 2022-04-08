#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Install brew or update to latest
which -s brew
if [[ $? != 0 ]] ; then
    # Install Homebrew
    echo "Installing homebrew"
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
    echo "Updating homebrew"
    brew update
fi

echo "Installing deps from Brewfile"
brew bundle