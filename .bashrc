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

#alias
alias grep='grep --color=auto'
alias l='ls -CF'
alias la='ls -A'
alias ll='ls -alF'
alias ls='ls --color=auto'
alias vi='vim'
alias gotodniserver='ssh pengyu.zhoug@dniserver'
alias rootgrep='grep --exclude-dir=home --exclude-dir=mnt --exclude-dir=var -snr '
alias updatecs='cscope -bqkR'
alias tat='tmux attach -t'

#functions
dniget()
{
	scp dniserver:~/smbdir/$1 .
}

export PATH=$HOME/local/bin:/usr/lib/git-core:/home/common/bin:$PATH
export PKG_CONFIG_PATH=${PKG_CONFIG_PATH}:${HOME}/lib/pkgconfig

# disable CTRL-D terminating terminal
set -o ignoreeof


[ -f ~/.fzf.bash ] && source ~/.fzf.bash
