if [ -f ~/.bashrc ]; then source ~/.bashrc; fi
if [ -e $HOME/.nix-profile/etc/profile.d/nix.sh ]; then . $HOME/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer

export CALIBRE_USE_SYSTEM_THEME=1
export QT_QPA_PLATFORMTHEME="qt5ct"

export QT_AUTO_SCREEN_SCALE_FACTOR=0
