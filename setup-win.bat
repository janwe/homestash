REM @powershell -NoProfile -ExecutionPolicy unrestricted -Command "iex ((new-object net.webclient).DownloadString('https://chocolatey.org/install.ps1'))" && SET PATH=%PATH%;%systemdrive%\chocolatey\bin
REM TODO try chocolatey

del /F "%USERPROFILE%\AppData\Roaming\Sublime Text 3\Packages\User\Preferences.sublime-settings"
mklink "%USERPROFILE%\AppData\Roaming\Sublime Text 3\Packages\User\Preferences.sublime-settings" "%USERPROFILE%\homestash\etc\Preferences.sublime-settings"

move "%USERPROFILE%\.gitconfig" "%USERPROFILE%\.gitconfig-bck"
mklink "%USERPROFILE%\.gitconfig" "%USERPROFILE%\homestash\dotfiles\gitconfig.win"


echo
echo #
echo # DONE! homestash windows install.
echo #
echo
pause
