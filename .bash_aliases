alias grep='grep --color=auto'
alias l='ls -CF'
alias la='ls -A'
#alias ll='ls -alF'
alias ll='tree -rt -L 1 -a -x -p -h -i -f -D' 
#alias ls='ls --color=auto'
#alias vi='vim'
alias rootgrep='grep --exclude-dir=home --exclude-dir=mnt --exclude-dir=var -snr'
alias updatecs='cscope -bqkR'
alias tat='tmux attach -t'
alias cmt='git commit -s'
alias sudop='sudo proxychains'
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias ping='ping -n'

sys_info=$(uname)
if [ x"${sys_info/inux/}" != x"$sys_info" ]; then
    alias open='xdg-open'
fi

SERVER_IP='107.182.177.9'

alias p='popd'
alias c='pushd'
alias m='mosh --ssh="ssh -p 29932" pengyu@'$SERVER_IP
alias s='ssh -p 29932 pengyu@23.105.212.181'
alias setproxy='export http_proxy="http://192.168.123.1:7777"; export https_proxy="http://192.168.123.1:7777"'
alias unsetproxy='export http_proxy= ; export https_proxy= '
