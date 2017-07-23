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
ln -sv "${DIR}/shell/.bash_prompt"  ~
ln -sv "${DIR}/shell/.bashrc"  ~
ln -sv "${DIR}/shell/.exports"  ~
ln -sv "${DIR}/shell/.functions"  ~
ln -sv "${DIR}/shell/.inputrc"  ~
ln -sv "${DIR}/shell/.path"  ~

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

echo "Install liquidprompt"
git clone --depth 1 https://github.com/nojhan/liquidprompt.git ~/liquidprompt
mkdir -p "~/.config"
ln -sv "${DIR}/shell/liquidpromptrc" "~/.config"

# Set bash shell as default
echo "/usr/local/bin/bash" | sudo tee -a /etc/shells
chsh -s /usr/local/bin/bash $USER

echo "Install node packages"
"${DIR}/node/install.sh"

echo "Setup vim"
ln -sv "${DIR}/vim/.vimrc" ~
"${DIR}/vim/install-vundle.sh"
