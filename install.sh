#!/usr/bin/env zsh

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

#vim
ln -s ${BASEDIR}/vimrc ~/.vimrc
ln -s ${BASEDIR}/vim/ ~/.vim

#zsh
ln -s ${BASEDIR}/aliases ~/.aliases.zsh
ln -s ${BASEDIR}/zshrc ~/.zshrc

#git
ln -s ${BASEDIR}/gitconfig ~/.gitconfig
ln -s ${BASEDIR}/gitignore ~/.gitignore
