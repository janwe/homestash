#!/usr/bin/env bash

echo
echo "Installing editors..."
editors=(
    sublime-text
)
for a_brew in ${editors[@]}; do
    brew install $a_brew
done

echo
echo "Done with editors!"

#Clean up and check system
echo
echo "Clean up brewery..."
brew cleanup
echo
echo "Check brewery..."
brew doctor

# Link Sublime settings
echo
if [[ -f "~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Preferences.sublime-settings" && ! -L "~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Preferences.sublime-settings" ]]; then
    echo "Linking Sublime settings from homestash.."
    mv ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Preferences.sublime-settings ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Preferences.sublime-settings.bck
    ln -s ~/homestash/etc/Preferences.sublime-settings ~/Library/Application\ Support/Sublime\ Text\ 3/Packages/User/Preferences.sublime-settings
else
    echo "Sublime settings already linked"
fi
