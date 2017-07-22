#!/usr/bin/env bash

# Get current directory
DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

# Copy root files
ln -sv"${DIR}/.curlrc"  ~
ln -sv"${DIR}/.editorconfig"  ~
ln -sv"${DIR}/.gdbinit"  ~
ln -sv"${DIR}/.wget"  ~

# Copy shell/ files
ln -sv"${DIR}/shell/*"  ~

# Copy git/ files
ln -sv"${DIR}/git/*"  ~

# Run all shell scripts
"${DIR}/mac/update.sh"
"${DIR}/mac/install.sh"
"${DIR}/mac/set-ulimit.sh"

# Install Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
cat "${DIR}/brew/Brewfile" | xargs brew install

# Setup vim
ln -sv "${DIR}/vim/.vimrc" ~
"${DIR}/vim/install-vundle.sh"
