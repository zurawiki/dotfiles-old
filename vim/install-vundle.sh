#!/usr/bin/env bash

# Clear existing Vundle repo
rm -rf ~/.vim/bundle/Vundle.vim

# Vundle install, shallow clone for speed
git clone --depth 1 https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

# Install plugins
vim +PluginInstall +qall
