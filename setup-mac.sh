#!/usr/bin/env bash

xcode-select --install

# Check for Homebrew
if test ! $(which brew); then
  echo "Installing homebrew.."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  brew analytics off
fi

brew update

echo
echo "Installing core stuff.."
core=(
    coreutils
    findutils
    libsodium
)
for a_brew in ${core[@]}; do
    brew install $a_brew
done

echo
echo "Installing utils.."
utils=(
    grep
    gawk
    tree
    wget
    ncurses
)
for a_brew in ${utils[@]}; do
    brew install $a_brew
done

echo
echo "Installing git stuff.."
gitstuff=(
    git
    bash-git-prompt
    zsh-git-prompt
    github-keygen
    kdiff3
)
for a_brew in ${gitstuff[@]}; do
    brew install $a_brew
done

#Clean up and check system
echo
echo "Clean up brewery..."
brew cleanup
echo
echo "Check brewery..."
brew doctor

github-keygen janwe
if [ ! -d "~/homestash"]; then
    git clone git@github.com:janwe/homestash.git ~/homestash
fi

source ~/homestash/mac/setup-dotfiles.sh

echo
echo "Done with setup. Remember to update .ssh/config"
echo
