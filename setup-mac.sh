#!/usr/bin/env bash

xcode-select --install

# Check for Homebrew
if test ! $(which brew); then
  echo "Installing homebrew.."
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

brew update

echo "Installing core stuff.."
core=(
	"coreutils --with-gmp"
    findutils
    bash
    bash-completion@2
    openssl
    #openconnect # not needed in BEKK anymore
)
brew install ${core[@]}
#PATH="/usr/local/opt/coreutils/libexec/gnubin:$PATH"
#MANPATH="/usr/local/opt/coreutils/libexec/gnuman:$MANPATH"
#PATH="/usr/local/opt/findutils/libexec/gnubin:$PATH"
#MANPATH="/usr/local/opt/findutils/libexec/gnuman:$MANPATH"

echo "Installing utils.."
utils=(
    grep
    gawk
    #jsawk
    tree
    #webkit2png
    wget
    #"pv  --with-gettext"
    #gnupg
)
brew install ${utils[@]}

echo "Installing git stuff.."
brew install git --with-gettext
brew install github-keygen
brew cask install kdiff3

echo "Installing Java stuff.."
brew cask install java8
brew cask install java
brew install maven

#JVM Langs
langs=(
	scala --with-docs --with-src
	sbt
	kotlin
)
# brew install ${langs[@]}

#AWS
aws=(
	awscli
	ec2-api-tools
	aws-elasticbeanstalk
	sshuttle
)
#brew install ${aws[@]}

#python
snakes=(
	python
	python3
)
# brew install ${snakes[@]}

#TODO nvm
#TODO rvm

#APPS
apps=(
    alfred
    moom
	dropbox
	sublime-text
    iterm2
	firefox
	google-chrome
	slack
    evernote
    intellij-idea
	spotify
	#openconnect-gui # not needed in BEKK anymore
    #citrix-receiver #SVV extapp
	#virtualbox
	#virtualbox-extension-pack
	#vagrant
	#wireshark
	#skype
	#skype-for-business
	#kindle
	#flickr-uploadr
	#charles
	#android-file-transfer
	#squirrelsql
	#hugin # photo sticher
	#gimp
	#flirc # fjernkontroll til RPi
	#omnidisksweeper
	#disk-inventory-x
	#burp-suite
	# TODO GitX
	#keepassx # Datainn
	#soundflower # pass audio to other apps
	# TODO audacity
)
brew cask install ${apps[@]}

# diff-pdf
#brew cask install xquartz
#brew install diff-pdf

# Link Sublime settings
if [[ -f "~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Preferences.sublime-settings" && ! -L "~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Preferences.sublime-settings" ]]; then
    echo "Linking sublime settings from homestash.."
    mv ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Preferences.sublime-settings ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Preferences.sublime-settings.bck
    ln -s ~/homestash/etc/Preferences.sublime-settings ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Preferences.sublime-settings
fi

# dotfiles
echo
echo "Linking dotfiles from homestash.."

source ~/homestash/linkdotfile.sh

PLAIN_DOTFILES=("bash_profile" "bashrc" "inputrc" "profile" "vimrc")
for a_dotfile in "${PLAIN_DOTFILES[@]}"; do
    linkdotfile "$a_dotfile"
done
linkdotfile gitconfig.mac gitconfig


#Check system
echo
echo "Check brewery..."
brew doctor
