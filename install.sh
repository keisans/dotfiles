#!/usr/bin/env zsh

BASEDIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
mkdir -p ${XDG_CONFIG_HOME:=$HOME/.xdg_config}

# Install all the vim plugins!
git pull origin master
git submodule update --init

# Create empty swap and backup folders for vim
if [[ ! -d ${BASEDIR}/vim/swap ]]; then
    mkdir ${BASEDIR}/vim/swap
fi

if [[ ! -d ${BASEDIR}/vim/backups ]]; then
    mkdir ${BASEDIR}/vim/backups
fi

#vim
ln -s ${BASEDIR}/vimrc ~/.vimrc
ln -s ${BASEDIR}/vim/ ~/.vim

#nvim
if [[ -d ${BASEDIR}/nvim ]]; then
    rm -rf ${BASEDIR}/nvim
fi
rsync -avhW --no-compress --progress ${BASEDIR}/vim ${BASEDIR}/nvim
cp ${BASEDIR}/vimrc ${BASEDIR}/nvim/init.vim
ln -s ${BASEDIR}/nvim/ $XDG_CONFIG_HOME/nvim

#zsh
ln -s ${BASEDIR}/aliases ~/.aliases.zsh
ln -s ${BASEDIR}/zshrc ~/.zshrc

#git
ln -s ${BASEDIR}/gitconfig ~/.gitconfig
ln -s ${BASEDIR}/gitignore ~/.gitignore

#eslint
ln -s ${BASEDIR}/eslintrc.json ~/.eslintrc
