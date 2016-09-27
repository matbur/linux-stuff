#!/usr/bin/env bash


DIR=$(realpath "$(dirname "$0")")

function create_ln() {
    ln -sfn "$DIR/$1" "$HOME/$1"
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
create_ln .img
create_ln .screenlayout

create_ln bin

create_ln .ptpython

