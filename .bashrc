# figure out what machine I'm in right now
if [ $(cat .MUID) = a57a753581205757ac302383c1a6b2f686a84356941c17d4eea95a227d6a25dc ]; 
then 
		export MACHINE_NAME="D"; 
fi

if [ $(cat .MUID) = 001e5a9f026a9def84d8d88e0a4ce9e3e59690f7 ];
then 
		export MACHINE_NAME="C"; 
fi

if [ $(cat .MUID) = a57a753581205757ac302383c1a6b2f686a84356941c17d4eea95a227d6a25dc ]; 
then 
		export MACHINE_NAME="C"; 
fi

if [ $(cat .MUID) = a57a753581205757ac302383c1a6b2f686a84356941c17d4eea95a227d6a25dc ]; 
then 
		export MACHINE_NAME="C"; 
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

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt
# ~/.bashrc: executed by bash(1) for non-login shells.
# see /usr/share/doc/bash/examples/startup-files (in the package bash-doc)
# for examples

# If not running interactively, don't do anything
case $- in
    *i*) ;;
      *) return;;
esac

# don't put duplicate lines or lines starting with space in the history.
# See bash(1) for more options
HISTCONTROL=ignoreboth

# append to the history file, don't overwrite it
shopt -s histappend

# for setting history length see HISTSIZE and HISTFILESIZE in bash(1)
HISTSIZE=1000
HISTFILESIZE=2000

# check the window size after each command and, if necessary,
# update the values of LINES and COLUMNS.
shopt -s checkwinsize

# If set, the pattern "**" used in a pathname expansion context will
# match all files and zero or more directories and subdirectories.
#shopt -s globstar

# make less more friendly for non-text input files, see lesspipe(1)
[ -x /usr/bin/lesspipe ] && eval "$(SHELL=/bin/sh lesspipe)"

# set variable identifying the chroot you work in (used in the prompt below)
if [ -z "${debian_chroot:-}" ] && [ -r /etc/debian_chroot ]; then
    debian_chroot=$(cat /etc/debian_chroot)
fi

# set a fancy prompt (non-color, unless we know we "want" color)
case "$TERM" in
    xterm-color) color_prompt=yes;;
esac

# uncomment for a colored prompt, if the terminal has the capability; turned
# off by default to not distract the user: the focus in a terminal window
# should be on the output of commands, not on the prompt
#force_color_prompt=yes

if [ -n "$force_color_prompt" ]; then
    if [ -x /usr/bin/tput ] && tput setaf 1 >&/dev/null; then
	# We have color support; assume it's compliant with Ecma-48
	# (ISO/IEC-6429). (Lack of such support is extremely rare, and such
	# a case would tend to support setf rather than setaf.)
	color_prompt=yes
    else
	color_prompt=
    fi
fi

if [ "$color_prompt" = yes ]; then
    PS1='${debian_chroot:+($debian_chroot)}\[\033[01;32m\]\u@\h\[\033[00m\]:\[\033[01;34m\]\w\[\033[00m\]\$ '
else
    PS1='${debian_chroot:+($debian_chroot)}\u@\h:\w\$ '
fi
unset color_prompt force_color_prompt

# If this is an xterm set the title to user@host:dir
case "$TERM" in
xterm*|rxvt*)
    PROMPT_COMMAND='echo -ne "\033]0;${USER}@${HOSTNAME}: ${PWD/$HOME/~}\007"'
    PS1="\[\e]0;${debian_chroot:+($debian_chroot)}\u@\h: \w\a\]$PS1"
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

# disable CTRL-D terminating terminal
set -o ignoreeof

if [ -f ~/.bash_aliases ]; then
    . ~/.bash_aliases
fi
# fzf, fuzzy search
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# enable programmable completion features (you don't need to enable
# this, if it's already enabled in /etc/bash.bashrc and /etc/profile
# sources /etc/bash.bashrc).
if ! shopt -oq posix; then
  if [ -f /usr/share/bash-completion/bash_completion ]; then
    . /usr/share/bash-completion/bash_completion
  elif [ -f /etc/bash_completion ]; then
    . /etc/bash_completion
  fi
fi

# enable color support of ls and also add handy aliases
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
fi

if [ "x$MACHINE_NAME" = "xD" ]
then
	echo "Have a good time";
fi
