#!/usr/bin/env bash

asdf plugin add yarn
asdf plugin add elixir
asdf plugin add helm
asdf plugin add kubectl
asdf plugin add ruby
asdf plugin add nodejs

asdf install ruby 2.6.5

bash ~/.asdf/plugins/nodejs/bin/import-release-team-keyring
asdf install nodejs 12.14.1
