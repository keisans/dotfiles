#!/usr/bin/env zsh

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Install all the vim plugins!
git pull origin master
git submodule update --init

# Create empty swap and backup folders for vim
mkdir ${BASEDIR}/vim/swap
mkdir ${BASEDIR}/vim/backups

#vim
ln -s ${BASEDIR}/vimrc ~/.vimrc
ln -s ${BASEDIR}/vim/ ~/.vim

#zsh
ln -s ${BASEDIR}/aliases ~/.aliases.zsh
ln -s ${BASEDIR}/zshrc ~/.zshrc

#git
ln -s ${BASEDIR}/gitconfig ~/.gitconfig
ln -s ${BASEDIR}/gitignore ~/.gitignore

#eslint
ln -s ${BASEDIR}/eslintrc.json ~/.eslintrc
