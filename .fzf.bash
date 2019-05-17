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

if [[ -d "$HOME/.fzf/" ]]; then
    if [[ ! "$PATH" == *$HOME/.fzf/bin* ]]; then
      export PATH="$PATH:$HOME/.fzf/bin"
    fi

# Auto-completion
# ---------------
    [[ $- == *i* ]] && source "$HOME/.fzf/shell/completion.bash" 2> /dev/null

# Key bindings
# ------------
    source "$HOME/.fzf/shell/key-bindings.bash"
fi

if [ -d /usr/share/fzf/ ]; then
    source /usr/share/fzf/key-bindings.bash
    source /usr/share/fzf/completion.bash
fi
