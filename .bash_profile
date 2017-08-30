export SHELL=$(which zsh)
export GOPATH=$HOME/work
export PATH=$GOPATH/bin:$PATH

# MacPorts Installer addition on 2015-10-16_at_20:00:35: adding an appropriate PATH variable for use with MacPorts.
#export PATH="/opt/local/bin:/opt/local/sbin:$PATH"
# Finished adapting your PATH environment variable for use with MacPorts.
export CLICOLOR=1
export LSCOLORS=GxFxCxDxBxegedabagaced

test -e "${HOME}/.iterm2_shell_integration.bash" && source "${HOME}/.iterm2_shell_integration.bash"
alias octave='/usr/local/octave/3.8.0/bin/octave-3.8.0'
alias pycharm='/Applications/PyCharm\ CE.app/Contents/MacOS/pycharm &'
# added by Anaconda3 4.3.0 installer
export PATH=/Users/vincent/bin/anaconda3/bin:$PATH
export GOPATH=$HOME/works/go
