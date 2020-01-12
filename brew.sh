#!/usr/bin/env bash

# Install command-line tools using Homebrew.

# Install brew or update to latest
which -s brew
if [[ $? != 0 ]] ; then
    # Install Homebrew
    /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
else
    brew update
fi

brew bundle