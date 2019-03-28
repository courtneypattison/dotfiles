#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
ln -sf $DIR/.vimrc ~
ln -sf $DIR/.bash_profile ~
ln -sf $DIR/.gitignore_global ~
ln -sf $DIR/.gitconfig ~
ln -sf $DIR/.inputrc ~
git config --global core.excludesfile ~/.gitignore_global
