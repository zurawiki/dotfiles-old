#!/usr/bin/env bash

# TODO consider make_dotfile function

# Get current directory
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

echo "Copy root files"
ln -sv "${DIR}/.curlrc"  ~
ln -sv "${DIR}/.editorconfig"  ~
ln -sv "${DIR}/.gdbinit"  ~
ln -sv "${DIR}/.wget"  ~

echo "Copy shell/ files"
ln -sv "${DIR}/shell/.aliases"  ~
ln -sv "${DIR}/shell/.bash_profile"  ~
ln -sv "${DIR}/shell/.bashrc"  ~
ln -sv "${DIR}/shell/.exports"  ~
ln -sv "${DIR}/shell/.functions"  ~
ln -sv "${DIR}/shell/.inputrc"  ~

echo "Copy git/ files"
ln -sv "${DIR}/git/.gitconfig"  ~
ln -sv "${DIR}/git/.gitignore"  ~

echo "Run all shell scripts"
"${DIR}/macos/update.sh"
"${DIR}/macos/install.sh"
"${DIR}/macos/set-ulimit.sh"

echo "Install Homebrew"
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
cat "${DIR}/homebrew/Brewfile" | xargs brew install

echo "Setup vim"
ln -sv "${DIR}/vim/.vimrc" ~
"${DIR}/vim/install-vundle.sh"
