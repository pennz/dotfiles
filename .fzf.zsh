# Setup fzf
# ---------
if [[ ! "$PATH" == */home/v/.fzf/bin* ]]; then
  export PATH="${PATH:+${PATH}:}/home/v/.fzf/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/home/v/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/home/v/.fzf/shell/key-bindings.zsh"
