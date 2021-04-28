#!/usr/bin/env bash

echo
echo "Installing snakes..."
snakes=(
    python
    python3
)
for a_brew in ${snakes[@]}; do
    brew install $a_brew
done

echo
echo "Done with snakes!"

#Clean up and check system
echo
echo "Clean up brewery..."
brew cleanup
echo
echo "Check brewery..."
brew doctor
