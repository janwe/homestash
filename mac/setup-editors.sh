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
echo "Linking Sublime settings from homestash..."
SETTINGS_DIR="$HOME/Library/Application Support/Sublime Text 3/Packages/User"
mkdir -p -v "$SETTINGS_DIR"
if [[ -f "$SETTINGS_DIR/Preferences.sublime-settings" && ! -L "$SETTINGS_DIR/Preferences.sublime-settings" ]]; then
    echo "Backing up existing Sublime settings file.."
    echo "Running: mv $SETTINGS_DIR/Preferences.sublime-settings $SETTINGS_DIR/Preferences.sublime-settings.bck"
    mv "$SETTINGS_DIR/Preferences.sublime-settings" "$SETTINGS_DIR/Preferences.sublime-settings.bck"
fi
if [[ ! -L "$SETTINGS_DIR/Preferences.sublime-settings" ]]; then
    echo "Creating link.."
    echo "Running: ln -s ~/homestash/etc/Preferences.sublime-settings $SETTINGS_DIR/Preferences.sublime-settings"
    ln -s ~/homestash/etc/Preferences.sublime-settings "$SETTINGS_DIR/Preferences.sublime-settings"
else
    echo "Skip linking - Sublime settings already linked"
fi
