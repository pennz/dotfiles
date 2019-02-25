# Setup fzf
# ---------
if [[ ! "$PATH" == */home/p/.fzf/bin* ]]; then
  export PATH="$PATH:/home/p/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/p/.fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/home/p/.fzf/shell/key-bindings.bash"

