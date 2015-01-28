#!/usr/bin/env bash

function __dm_link_up() {
  ln -sf $HOME/links/.dougrc $HOME/
  ln -sf $HOME/links/.gitignore $HOME/
  ln -sf $HOME/links/.gitconfig $HOME/
  ln -sf $HOME/links/.vimrc $HOME/
  ln -sf $HOME/links/.git-prompt.sh $HOME/
  ln -sf $HOME/links/git-completion.bash $HOME/
}

__dm_link_up()

