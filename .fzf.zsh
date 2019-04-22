# Setup fzf
# ---------
if [[ -d "/usr/local/opt/fzf/" ]]; then
    if [[ ! "$PATH" == */usr/local/opt/fzf/bin* ]]; then
      export PATH="$PATH:/usr/local/opt/fzf/bin"
    fi
    # Auto-completion
    # ---------------
    [[ $- == *i* ]] && source "/usr/local/opt/fzf/shell/completion.zsh" 2> /dev/null

    # Key bindings
    # ------------
    source "/usr/local/opt/fzf/shell/key-bindings.zsh"
fi

if [[ -d "$HOME/.fzf/" ]]; then
    if [[ ! "$PATH" == *$HOME/.fzf/bin* ]]; then
      export PATH="$PATH:$HOME/.fzf/bin"
    fi

# Auto-completion
# ---------------
    [[ $- == *i* ]] && source "$HOME/.fzf/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
    source "$HOME/.fzf/shell/key-bindings.zsh"
fi

if [ -d /usr/share/fzf/ ]; then
    source /usr/share/fzf/key-bindings.zsh
    source /usr/share/fzf/completion.zsh
fi
