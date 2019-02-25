# Setup fzf
# ---------
if [[ ! "$PATH" == */usr/local/opt/fzf/bin* ]]; then
  export PATH="$PATH:/usr/local/opt/fzf/bin"
# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/usr/local/opt/fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/usr/local/opt/fzf/shell/key-bindings.zsh"
fi

if [[ ! "$PATH" == */home/p/.fzf/bin* ]]; then
  export PATH="$PATH:/home/p/.fzf/bin"

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/p/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/p/.fzf/shell/key-bindings.zsh"

fi
