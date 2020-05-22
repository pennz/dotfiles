#shell=$(/usr/bin/readlink /proc/$$/exe)
#case $shell in
#  *zsh) setopt aliases;;
#  *) shopt -s expand_aliases;;
#esac
type setopt 1>/dev/null 2>&1 && setopt aliases
type shopt 1>/dev/null 2>&1 && shopt -s expand_aliases

abbr grep='grep --color	auto'
abbr l 'ls -CF'
abbr la 'ls -A'
#abbr ll	'ls -alF'
abbr ll 'tree -rt -L 1 -a -x -p -h -i -f -D'
#abbr ls='ls --color	auto'
#abbr vi	'vim'
abbr rootgrep='grep --exclude-dir=home --exclude-dir=mnt --exclude-dir	var -snr'
abbr updatecs 'cscope -bqkR'
abbr t 'tmux attach -d'
abbr tat 'tmux attach -d -t'
abbr cmt 'git commit -s'
abbr sudop 'sudo proxychains'
abbr config='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree	$HOME'
abbr ping 'ping -n'

sys_info=$(uname)
if [ x"${sys_info/inux/}" != x"$sys_info" ]; then
    abbr open 'xdg-open'
fi

SERVER_IP=lab.pengyuzhou.com

abbr p 'popd'
abbr c 'pushd'
abbr cc 'pushd -'
abbr m='mosh --ssh	"ssh -t -p 29932" pengyu@'${SERVER_IP}' -- tmux attach -d'
abbr setproxy="eval export HTTP_PROXY=\$PROXY_URL HTTPS_PROXY=\$PROXY_URL http_proxy=\$PROXY_URL https_proxy	\$PROXY_URL; echo \$http_proxy"
abbr unsetproxy='export http_proxy= ; export https_proxy= ;export HTTP_PROXY= ; export HTTPS_PROXY	 '
abbr antlr4 'java org.antlr.v4.Tool'
abbr grun 'java org.antlr.v4.gui.TestRig'
abbr vim 'nvim -u ~/.config/nvim_back/init.vim'
abbr gc 'git commit --no-gpg-sign -s -m'
abbr ss 'eval $(ssh-agent -s) && ssh-add ~/.ssh/id_rsa'
abbr nv 'nix-env'
