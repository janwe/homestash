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
    tig
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

if [ ! -f "$HOME/.ssh/id_janwe@github" ]; then
    echo
    echo "Generating new SSH key for Github..."
    github-keygen janwe
else
    echo
    echo "Skipping keygen. Github key already exists."
    echo
fi
if [ ! -d "$HOME/homestash" ]; then
    echo
    echo "Cloning homestash..."
    git clone git@janwe.github.com:janwe/homestash.git ~/homestash
else
    echo
    echo "Skip cloning. Homestash already exists."
    echo
fi
if [ -f "$HOME/homestash/mac/setup-dotfiles.sh" ]; then
    echo
    echo "Setting up dotfiles from homestash..."
    source ~/homestash/mac/setup-dotfiles.sh
else
    echo
    echo "Skipping setup of dotfiles. 'setup-dotfiles.sh' not found - is repo cloned and on correct branch?"
    echo
fi

echo
echo "Done with setup. Remember to update .ssh/config"
echo
