#!/usr/bin/env bash

function create_ln() {
    ln -sf ${PWD}/$1 ${HOME}/$1
}

create_ln .vimrc
curl -fLo ~/.vim/autoload/plug.vim --create-dirs \
        https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

create_ln .zshrc
create_ln .git-completion.bash
create_ln .aliases.sh

create_ln .i3blocks.conf
create_ln .config/i3/config

create_ln bin