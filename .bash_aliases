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
#alias vi='vim'
alias rootgrep='grep --exclude-dir=home --exclude-dir=mnt --exclude-dir=var -snr'
alias updatecs='cscope -bqkR'
alias t='tmux attach -d'
alias tat='tmux attach -d -t'
alias cmt='git commit -s'
alias sudop='sudo proxychains'
alias config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=$HOME'
alias ping='ping -n'

# if [ x"{$sys_info/inux/}" != x"$sys_info" ]; then alias open='xdg-open' fi

alias p='popd'
alias c='pushd'
alias cc='pushd -'
alias m='mosh --ssh="ssh -t -p 29932" pengyu@pengyuzhou.com -- tmux'
alias setproxy="eval export HTTP_PROXY=\$PROXY_URL HTTPS_PROXY=\$PROXY_URL http_proxy=\$PROXY_URL https_proxy=\$PROXY_URL; echo \$http_proxy"
alias unsetproxy='export http_proxy= ; export https_proxy= ;export HTTP_PROXY= ; export HTTPS_PROXY= '
alias antlr4='java org.antlr.v4.Tool'
alias grun='java org.antlr.v4.gui.TestRig'
alias vim='nvim -u ~/.config/nvim_back/init.vim'
alias gc='git commit --no-gpg-sign -s -m'
alias ss='eval $(ssh-agent -s) && ssh-add ~/.ssh/id_rsa'
alias nv='nix-env'
