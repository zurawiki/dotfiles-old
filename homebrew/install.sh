#!/usr/bin/env bash
set -euo pipefail

echo "Install Homebrew"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"
brew update
brew upgrade
cat "${DIR}/homebrew/Brewfile" | xargs brew install
cat "${DIR}/homebrew/Caskfile" | xargs brew cask install

brew cleanup
