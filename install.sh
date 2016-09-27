#!/usr/bin/env bash


DIR=$(dirname $0)
DIR=$PWD
echo $DIR

function create_ln() {
    ln -sf ${DIR}/$1 ${HOME}/$1
}

function create_ln_dir() {
    ln -sfn ${DIR}/$1 ${HOME}/$1
}

create_ln .vimrc
curl -sfLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

create_ln .bashrc
create_ln .zshrc
create_ln .git-completion.bash
create_ln .gitconfig
create_ln .aliases.sh

create_ln .i3blocks.conf
create_ln .config/i3/config

create_ln_dir bin

create_ln_dir .ptpython

create_ln_dir .img
