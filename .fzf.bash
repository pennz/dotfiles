# Setup fzf
# ---------
if [[ ! "$PATH" == */home/pengyu/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/pengyu/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/pengyu/.fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/home/pengyu/.fzf/shell/key-bindings.bash"
