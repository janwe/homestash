#!/usr/bin/env bash

# dotfiles
echo
echo "Linking dotfiles from homestash.."

source ~/homestash/linkdotfile.sh

PLAIN_DOTFILES=("bash_profile" "bashrc" "inputrc" "profile" "vimrc")
for a_dotfile in "${PLAIN_DOTFILES[@]}"; do
    linkdotfile "$a_dotfile"
done
linkdotfile gitconfig.mac gitconfig
