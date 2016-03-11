#!/usr/bin/env zsh

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
mkdir -p ${XDG_CONFIG_HOME:=$HOME/.xdg_config}

# Install all the vim plugins!
git pull origin master
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

#git
ln -snf ${BASEDIR}/gitconfig ~/.gitconfig
ln -snf ${BASEDIR}/gitignore ~/.gitignore

#eslint
ln -snf ${BASEDIR}/eslintrc.json ~/.eslintrc

#tmux
ln -snf ${BASEDIR}/tmux.conf ~/.tmux.conf
