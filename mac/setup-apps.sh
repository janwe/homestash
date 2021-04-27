#!/usr/bin/env bash

#Brukte apps:
#Sonos S2 (fant bare S1)
#Trello (app store?)
#Logi Options (finnes ikke)
#Synology Assistant (finnes ikke)
#Pexip (my meeting video)
#SuuntoLink (finner bare gamle moveslink2)
#Tweetdeck

echo
echo "Installing apps..."
apps=(
    alfred
    moom
    witch
    dropbox
    iterm2
    firefox
    google-chrome
    slack
    evernote
    spotify
    kindle
    android-file-transfer
    microsoft-teams
    zoom
    discord
    pocket-casts
    #"--cask docker"
    #microsoft-office
    #gimp
    #keepassx # Datainn
    lastpass
)
for a_brew in ${apps[@]}; do
    brew install $a_brew
done

#brew tap homebrew/cask-drivers
#brew install synology-drive

echo
echo "Done with apps!"

#Clean up and check system
echo
echo "Clean up brewery..."
brew cleanup
echo
echo "Check brewery..."
brew doctor

#Old apps
    #Citrix Workspace/Receiver
    #soundflower (pass audio to other apps)
    #audacity
    #xquartz
    #flirc (fjernkontroll til RPi)
    #omnidisksweeper
    #disk-inventory-x
    #squirrelsql
    #hugin (photo sticher)
    #virtualbox
    #virtualbox-extension-pack
    #vagrant
    #wireshark
    #flickr-uploadr
    #charles
