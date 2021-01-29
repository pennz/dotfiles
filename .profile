#!/bin/bash
# env vars
export GOPATH="$HOME"/go
# export LC_ALL=en_US.UTF-8
# export LANG=en_US.UTF-8

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# disable CTRL-D terminating terminal
set -o ignoreeof

# nvim back folder
[ ! -d "$HOME"/.vim/backup/ ] && mkdir -p "$HOME"/.vim/backup
[ ! -d "$HOME"/.vim/swap/ ] && mkdir -p "$HOME"/.vim/swap
[ ! -d "$HOME"/.vim/undo/ ] && mkdir -p "$HOME"/.vim/undo

# fuck
command -v fuck >/dev/null && eval "$(thefuck --alias)"

# for visual studio code
export DOTNET_CLI_TELEMETRY_OPTOUT=1

# for my binaries
PATH=$PATH:"$HOME"/bin:"$HOME"/.local/bin

#export WORKON_HOME="$HOME"/.virtualenvs
# virtualenv and virtualenvwrapper
#export VIRTUALENVWRAPPER_PYTHON=/usr/bin/python3
#[ -f /usr/local/bin/virtualenvwrapper.sh ] && source /usr/local/bin/virtualenvwrapper.sh
#[ -f /usr/bin/virtualenvwrapper.sh ] && source /usr/bin/virtualenvwrapper.sh

export GPG_TTY=$(tty)
export KEYTIMEOUT=1
export BASH_ENV=~/.vim_bash_env
export CLASSPATH=".:/usr/local/lib/antlr-4.8-complete.jar:$CLASSPATH"

TRY=/etc/profile.d/nix.sh
if [ ! -e "$TRY" ]; then TRY=$HOME/.nix-profile/etc/profile.d/nix.sh; fi
if [ -e "$TRY" ]; then
    source "$TRY"
    export LOCALE_ARCHIVE="$(nix-env --installed --no-name --out-path --query glibc-locales)/lib/locale/locale-archive" # fix locale prolem for nix pkgs, reference https://unix.stackexchange.com/questions/187402/nix-package-manager-perl-warning-setting-locale-failed
    export NIX_PATH=$HOME/.nix-defexpr/channels${NIX_PATH:+:}$NIX_PATH
fi

if [ -f "$HOME"/.bash_aliases ]; then
    source "$HOME"/.bash_aliases
fi

export PYTHON_KEYRING_BACKEND=keyring.backends.null.Keyring
( ps $$ | grep bash ) && ( [ -f ~/.fzf.bash ] && source "$HOME"/.fzf.bash ) || true
