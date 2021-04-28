#!/usr/bin/env bash
# TODO initial setup for CYGWIN

export CYGWIN=winsymlinks:nativestrict

# dotfiles
echo
echo "Linking dotfiles from homestash.."

source ~/homestash/linkdotfile.sh

PLAIN_DOTFILES=("bash_profile" "bashrc" "minttyrc" "profile" "vimrc")
for a_dotfile in "${PLAIN_DOTFILES[@]}"; do
    linkdotfile "$a_dotfile"
done
linkdotfile inputrc.cyg inputrc
#linkdotfile gitconfig.win gitconfig
