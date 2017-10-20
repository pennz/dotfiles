export SHELL=$(which zsh)
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

# should add conditions for different computers, i.e., Mac, PC, VPS
test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
alias octave='/usr/local/octave/3.8.0/bin/octave-3.8.0'
alias pycharm='/Applications/PyCharm\ CE.app/Contents/MacOS/pycharm &'

export GOPATH=$HOME/works/go
export PATH=/Users/vincent/bin/anaconda3/bin:$GOPATH/bin:$PATH
