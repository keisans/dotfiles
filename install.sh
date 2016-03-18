#!/usr/bin/env zsh

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"

# Install all the things!
git checkout master && git up
git submodule update --init --recursive

# Create empty swap and backup folders for vim
if [[ ! -d ${BASEDIR}/vim/swap ]]; then
    mkdir ${BASEDIR}/vim/swap
fi

if [[ ! -d ${BASEDIR}/vim/backups ]]; then
    mkdir ${BASEDIR}/vim/backups
fi

#vim
ln -snf ${BASEDIR}/vimrc ~/.vimrc
ln -snf ${BASEDIR}/vim/ ~/.vim

#zsh
ln -snf ${BASEDIR}/zsh/ ~/.zsh
ln -snf ${BASEDIR}/aliases ~/.aliases.zsh
ln -snf ${BASEDIR}/custom_functions ~/.custom_functions.zsh
ln -snf ${BASEDIR}/zshrc ~/.zshrc
ln -snf ${BASEDIR}/zprezto ~/.zprezto
ln -snf ${BASEDIR}/zpreztorc ~/.zpreztorc

#git
ln -snf ${BASEDIR}/gitconfig ~/.gitconfig
ln -snf ${BASEDIR}/gitignore ~/.gitignore

#eslint
ln -snf ${BASEDIR}/eslintrc.json ~/.eslintrc

#tmux
ln -snf ${BASEDIR}/tmux.conf ~/.tmux.conf

#cards
ln -snf ${BASEDIR}/cards ~/.cards
