# figure out what machine I'm in right now
if [ $(cat .MUID) = a57a753581205757ac302383c1a6b2f686a84356941c17d4eea95a227d6a25dc ]; 
then 
		export MACHINE_NAME="D"; 
fi

if [ $(cat .MUID) = a57a753581205757ac302383c1a6b2f686a84356941c17d4eea95a227d6a25dc ]; 
then 
		echo "eq" ; 
fi

if [ $(cat .MUID) = a57a753581205757ac302383c1a6b2f686a84356941c17d4eea95a227d6a25dc ]; 
then 
		echo "eq" ; 
fi

if [ $(cat .MUID) = a57a753581205757ac302383c1a6b2f686a84356941c17d4eea95a227d6a25dc ]; 
then 
		echo "eq" ; 
fi

#some color define
BLACK='\[\e[30m\]'
RED='\[\e[31m\]'
GREEN='\[\e[32m\]'
YELLOW='\[\e[33m\]'
BLUE='\[\e[34m\]'
MAGENTA='\[\e[35m\]'
CYAN='\[\e[36m\]'
WHITE='\[\e[37m\]'
NORMAL='\[\e[0m\]'

# If not running interactively, don't do anything
[ -z "$PS1" ] && return

# don't put duplicate lines in the history. See bash(1) for more options
export HISTCONTROL=ignoredups

# change terminal type to support 256 colors
# [ "x$TERM" = "xxterm" -a -e /usr/share/terminfo/x/xterm-256color ] && TERM='xterm-256color'
[ "$TERM" = "xterm" ] && TERM='xterm-256color'

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
*256color|screen)
    if [ "x$UID" != "x0" ]; then
        PS1="${GREEN}[${CYAN}\u${YELLOW}@${GREEN}\h ${YELLOW}\w${GREEN}]\n\$ ${NORMAL}"
    else
        PS1="${GREEN}[${RED}\u@\h ${YELLOW}\w${GREEN}]\n\$ ${NORMAL}"
    fi
    ;;
*)
    PS1='[\u@\H \W]\$ '
    ;;
esac

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007"'
    ;;
*)
    ;;
esac

# display man infor colorful
export LESS_TERMCAP_mb=$'\E[01;31m'
export LESS_TERMCAP_md=$'\E[01;31m'
export LESS_TERMCAP_me=$'\E[0m'
export LESS_TERMCAP_se=$'\E[0m'
export LESS_TERMCAP_so=$'\E[01;44;33m'
export LESS_TERMCAP_ue=$'\E[0m'
export LESS_TERMCAP_us=$'\E[01;32m'
export GROFF_NO_SGR=yes

# drawing line in ncurses display normal.
export NCURSES_NO_UTF8_ACS=1

#undefine color
unset BLACK
unset RED
unset GREEN
unset YELLOW
unset BLUE
unset MAGENTA
unset CYAN
unset WHITE
unset NORMAL

# ls colors
eval `dircolors ~/.dir_colors`

# alias
[ -f ~/.bash_alias ] && source ~/.bash_alias

# disable CTRL-D terminating terminal
set -o ignoreeof

# fzf, fuzzy search
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

if [ $MACHINE_NAME = D ]
then
	echo "Have a good time";
fi

