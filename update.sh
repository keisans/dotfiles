#!/bin/bash

brew update
brew upgrade neovim

vim +PlugUpdate +qall
