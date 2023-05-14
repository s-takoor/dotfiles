# Setup fzf
# ---------
if [[ ! "$PATH" == */opt/homebrew/Cellar/fzf/0.40.0/bin* ]]; then
  PATH="${PATH:+${PATH}:}/opt/homebrew/Cellar/fzf/0.39.0/bin"
fi

# Auto-completion
# ---------------
[[ $- == *i* ]] && source "/opt/homebrew/Cellar/fzf/0.40.0/shell/completion.zsh" 2> /dev/null

# Key bindings
# ------------
source "/opt/homebrew/Cellar/fzf/0.40.0/shell/key-bindings.zsh"
