# get latest and update formulae
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew tap homebrew/versions
brew update

# upgrade existing stuff
brew upgrade

# make sure core stuff is up to date
brew install coreutils
brew install findutils
brew install bash

# extra utils
brew install wget
brew install tree
brew install webkit2png

## get dev stuff
brew install git
brew install git-extras
brew install maven
brew install scala
brew install sbt
brew install kdiff3

brew install scala210
brew install scala
brew install sbt

brew install node

# do some housekeeping
brew cleanup #IS THIS SAFE WITH VERSIONS REPO?
brew doctor
