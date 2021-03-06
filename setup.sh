#!/usr/bin/env bash

function __dm_link_up() {
  ln -sf $HOME/dotfiles/links/.dougrc $HOME/
  ln -sf $HOME/dotfiles/links/.gitignore $HOME/
  ln -sf $HOME/dotfiles/links/.gitconfig $HOME/
  ln -sf $HOME/dotfiles/links/.vimrc $HOME/
  ln -sf $HOME/dotfiles/links/.vim $HOME/
  ln -sf $HOME/dotfiles/links/.git-prompt.sh $HOME/
  ln -sf $HOME/dotfiles/links/.git-update-application.sh $HOME/
  ln -sf $HOME/dotfiles/links/git-completion.bash $HOME/
  ln -sf $HOME/dotfiles/links/.ssh-config-autocomplete.sh $HOME/
}

__dm_link_up

