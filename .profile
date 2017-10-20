# figure out what machine I'm in right now
if [ "$(cat .MUID)" = a57a753581205757ac302383c1a6b2f686a84356941c17d4eea95a227d6a25dc ]; 
then 
		export MACHINE_NAME="D"; 
fi


if [ "$(cat .MUID)" = a57a753581205757ac302383c1a6b2f686a84356941c17d4eea95a227d6a25dc ]; 
then 
		echo "eq" ; 
fi

if [ "$(cat .MUID)" = aca16920583e42bdcf5fc70618f55b6a ]
then 
		export MACHINE_NAME="M"; 
fi

if [ "$(cat .MUID)" = a57a753581205757ac302383c1a6b2f686a84356941c17d4eea95a227d6a25dc ]; 
then 
		echo "eq" ; 
fi

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# disable CTRL-D terminating terminal
set -o ignoreeof

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi

if [ -f ~/.bash_customed ]; then
    . ~/.bash_customed
fi

# fzf, fuzzy search
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

if [ "x$MACHINE_NAME" = "xD" ]
then
	echo "Have a good time";
fi
