# Setup fzf
# ---------
if [[ -d "/usr/local/opt/fzf/" ]]; then
if [[ ! "$PATH" == */usr/local/opt/fzf/bin* ]]; then
  export PATH="$PATH:/usr/local/opt/fzf/bin"
fi
# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/usr/local/opt/fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
source "/usr/local/opt/fzf/shell/key-bindings.bash"
fi

if [[ -d "/home/p/.fzf/" ]]; then
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

