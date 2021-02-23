#!/usr/bin/env bash

DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
ln -sf $DIR/.vimrc ~
ln -sf $DIR/.zshrc ~
ln -sf $DIR/.gitconfig ~
