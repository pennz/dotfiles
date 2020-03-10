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
PROXY_URL='http://127.0.0.1:31210'

alias p='popd'
alias c='pushd'
alias m='mosh --ssh="ssh -p 29932" pengyu@'$SERVER_IP
alias s="ssh -p 29932 pengyu@$SERVER_IP"
alias setproxy="export http_proxy=$PROXY_URL; export https_proxy=$PROXY_URL; "'echo $http_proxy'
#alias setproxy='export http_proxy="http://127.0.0.1:10808"; export https_proxy="http://127.0.0.1:10808"; echo $http_proxy'
alias unsetproxy='export http_proxy= ; export https_proxy= '
