#!/usr/bin/env bash

echo
echo "Installing shells..."
shells=(
    bash
    bash-completion@2
    zsh
)
for a_brew in ${shells[@]}; do
    brew install $a_brew
done

echo
echo "Done with shells!"

#Clean up and check system
echo
echo "Clean up brewery..."
brew cleanup
echo
echo "Check brewery..."
brew doctor
