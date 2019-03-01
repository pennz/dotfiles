# Setup fzf
# ---------
if [ -d $HOME/.fzf ]; then
if [[ ! "$PATH" == */home/p/.fzf/bin* ]]; then
  export PATH="$PATH:/home/p/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/p/.fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/home/p/.fzf/shell/key-bindings.bash"
fi


if [ -d /usr/share/fzf/ ]; then
    source /usr/share/fzf/key-bindings.bash
    source /usr/share/fzf/completion.bash
fi
