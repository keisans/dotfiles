#!/bin/bash

cd $(dirname $BASH_SOURCE)
BASE=$(pwd)

mkdir -p ./vim/autoload
curl --insecure -fLo ./vim/autoload/plug.vim https://raw.github.com/junegunn/vim-plug/master/plug.vim

#term vim
mv -v ~/.vimrc ~/.vimrc.old > /dev/null
ln -sf $BASE/vimrc ~/.vimrc

#nvim
mkdir -p ~/.config/nvim/autoload
ln -sf $BASE/vimrc ~/.config/nvim/init.vim
ln -sf ~/.vim/autoload/plug.vim ~/.config/nvim/autoload
ln -sf ~/.vim/colors ~/.config/nvim/colors

vim +PlugInstall +qall
