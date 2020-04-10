#shell=$(/usr/bin/readlink /proc/$$/exe)
#case $shell in
#  *zsh) setopt aliases;;
#  *) shopt -s expand_aliases;;
#esac
type setopt > /dev/null && setopt aliases
type shopt > /dev/null && shopt -s expand_aliases

alias grep='grep --color=auto'
alias l='ls -CF'
alias la='ls -A'
#alias ll='ls -alF'
alias ll='tree -rt -L 1 -a -x -p -h -i -f -D' 
#alias ls='ls --color=auto'
#alias vi='vim'
alias rootgrep='grep --exclude-dir=home --exclude-dir=mnt --exclude-dir=var -snr'
alias updatecs='cscope -bqkR'
alias t='tmux attach -d'
alias tat='tmux attach -d -t'
alias cmt='git commit -s'
alias sudop='sudo proxychains'
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias ping='ping -n'

sys_info=$(uname)
if [ x"${sys_info/inux/}" != x"$sys_info" ]; then
    alias open='xdg-open'
fi

SERVER_IP=lab.pengyuzhou.com

alias p='popd'
alias c='pushd'
alias m='mosh --ssh="ssh -t -p 29932" pengyu@'${SERVER_IP}' -- tmux attach -d'
alias setproxy="export HTTP_PROXY=$PROXY_URL; export HTTPS_PROXY=$PROXY_URL; export http_proxy=$PROXY_URL; export https_proxy=$PROXY_URL; "'echo $http_proxy'
alias unsetproxy='export http_proxy= ; export https_proxy= '
alias antlr4='java org.antlr.v4.Tool'
alias grun='java org.antlr.v4.gui.TestRig'
alias vim='nvim -u ~/.config/nvim_back/init.vim'
