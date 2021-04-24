#!/usr/bin/env bash

echo
echo "Installing other stuff..."
stuff=(
    diff-pdf
)
for a_brew in ${stuff[@]}; do
    brew install $a_brew
done

echo
echo "Done with other stuff!"

#Clean up and check system
echo
echo "Clean up brewery..."
brew cleanup
echo
echo "Check brewery..."
brew doctor
