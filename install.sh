#!/usr/bin/env bash
set -euo pipefail

# TODO consider make_dotfile function

# Get current directory
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Close any open System Preferences panes, to prevent them from overriding
# settings we’re about to change
echo "closing any system preferences to prevent issues with automated changes"
osascript -e 'tell application "System Preferences" to quit'

# Ask for the administrator password upfront
sudo -v

echo "Copy root files"
ln -svf "${DIR}/.curlrc"  ~
ln -svf "${DIR}/.editorconfig"  ~
ln -svf "${DIR}/.gdbinit"  ~
ln -svf "${DIR}/.wget"  ~

echo "Copy git/ files"
ln -svf "${DIR}/git/.gitconfig"  ~
ln -svf "${DIR}/git/.gitignore"  ~

echo "Copy shell/ files"
ln -svf "${DIR}/shell/.aliases"  ~
ln -svf "${DIR}/shell/.exports"  ~
ln -svf "${DIR}/shell/.functions"  ~
ln -svf "${DIR}/shell/.inputrc"  ~
ln -svf "${DIR}/shell/.path"  ~
ln -svf "${DIR}/shell/.zsh_profile"  ~
ln -svf "${DIR}/shell/.zsh_prompt"  ~
ln -svf "${DIR}/shell/.zsh_setopts"  ~
ln -svf "${DIR}/shell/.zshrc"  ~

echo "› sudo softwareupdate -i -a"
sudo softwareupdate -i -a

echo "Run all shell scripts"
"${DIR}/macos/install.sh"

echo "Install Homebrew"
"${DIR}/homebrew/install.sh"

echo "Setup vim"
ln -svf "${DIR}/vim/.vimrc" ~

# Set default shell
echo "/usr/local/bin/fish" | sudo tee -a /etc/shells
chsh -s /usr/local/bin/fish $USER


echo "- Restarting SystemUIServer"
killall SystemUIServer
