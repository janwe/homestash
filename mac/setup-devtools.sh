#!/usr/bin/env bash

echo
echo "Installing devtools..."
devtools=(
    #"--cask docker"
    github
    intellij-idea
)
for a_brew in ${devtools[@]}; do
    brew install $a_brew
done

echo
echo "Done with devtools!"

#Clean up and check system
echo
echo "Clean up brewery..."
brew cleanup
echo
echo "Check brewery..."
brew doctor
