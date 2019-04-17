#!/usr/bin/env bash

echo
echo "Updating apt and system packages..."
sudo apt update
sudo apt upgrade

echo
echo "Installing bash and terminal stuff..."
sudo apt install bash
sudo apt install bash-completion
sudo apt install tmux

echo
echo "Installing editors..."
sudo apt install nano
sudo apt install vim

echo
echo "Installing openssh client..."
sudo apt install openssh-client

echo
echo "Installing git stuff..."
sudo apt install git
sudo apt install kdiff3

echo
echo "Installing java stuff..."
sudo apt install java-common
sudo apt install openjdk-8-jdk
sudo apt install maven
sudo apt install gradle

echo
echo "Installing python stuff..."
sudo apt install python3

echo
echo "Installing ruby stuff..."
sudo apt install ruby
sudo apt install rbenv

echo
echo "Installing node stuff..."
sudo apt install nodejs
sudo apt install nodeenv

echo
echo "Installing keychain..."
sudo apt install keychain

echo
echo "Cleaning up..."
sudo apt autoremove

# dotfiles
echo
echo
echo "Linking dotfiles from homestash.."
echo

source ~/homestash/linkdotfile.sh

PLAIN_DOTFILES=("bash_profile" "bashrc" "inputrc" "profile" "vimrc")
for a_dotfile in "${PLAIN_DOTFILES[@]}"; do
    linkdotfile "$a_dotfile"
done
linkdotfile gitconfig.wsl gitconfig

