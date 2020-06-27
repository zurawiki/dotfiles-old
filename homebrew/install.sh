#!/usr/bin/env bash
set -euo pipefail

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo '- Installing brew ... '
echo | /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)" > /dev/null
if [ $? -eq 0 ]; then echo 'Homebrew install OK'; else echo 'Homebrew install error!'; false; fi

brew update
brew upgrade
cat "${DIR}/Brewfile" | xargs brew install

brew tap homebrew/cask-fonts

cat "${DIR}/Caskfile" | xargs brew cask install --force

brew cleanup
