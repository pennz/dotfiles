#shell=$(/usr/bin/readlink /proc/$$/exe)
#case $shell in
#  *zsh) setopt aliases;;
#  *) shopt -s expand_aliases;;
#esac
type setopt 1>/dev/null 2>&1 && setopt aliases
type shopt 1>/dev/null 2>&1 && shopt -s expand_aliases

alias grep='grep --color=auto'
alias l='ls -CF'
alias la='ls -A'
#alias ll='ls -alF'
alias ll='tree -rt -L 1 -a -x -p -h -i -f -D'
#alias ls='ls --color=auto'
alias rootgrep='grep --exclude-dir=home --exclude-dir=mnt --exclude-dir=var -snr'
alias updatecs='cscope -bqkR'
alias t='tmux attach -d'
alias ta='tmux attach'
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
PROXY_URL='http://172.26.21.21:1087'

alias p='popd'
alias c='pushd'
alias cc='pushd -'
alias m='LC_ALL="en_US.UTF-8" mosh --ssh="ssh -t -p 29932" pengyu@pengyuzhou.com -- tmux attach'
alias mt='LC_ALL="en_US.UTF-8" mosh --ssh="ssh -t -p 29932" pengyu@pengyuzhou.com -- tmux'
alias ms='LC_ALL="en_US.UTF-8" mosh --ssh="ssh -t -p 29932" pengyu@pengyuzhou.com'
alias s='LC_ALL="en_US.UTF-8" ssh -p 29932 pengyu@pengyuzhou.com'
alias setproxy="eval export HTTP_PROXY=\$PROXY_URL HTTPS_PROXY=\$PROXY_URL http_proxy=\$PROXY_URL https_proxy=\$PROXY_URL; echo \$http_proxy"
alias unsetproxy='export http_proxy= ; export https_proxy= ;export HTTP_PROXY= ; export HTTPS_PROXY= '
alias gc='git commit --no-gpg-sign -s -m'
alias sss='eval $(ssh-agent -s) && ssh-add ~/.ssh/id_rsa'
alias nv='nix-env'
alias antrl4="java org.antlr.v4.Tool"
alias grun="java org.antlr.v4.runtime.misc.TestRig"
alias antlr4py3="java org.antlr.v4.Tool -Dlanguage=Python3"
alias antlr4py2="java org.antlr.v4.Tool -Dlanguage=Python2"
alias antlr4vpy3="java org.antlr.v4.Tool -Dlanguage=Python3 -no-listener -visitor"
alias antlr4vpy2="java org.antlr.v4.Tool -Dlanguage=Python2 -no-listener -visitor"
alias pygrun="poetry run pygrun"
