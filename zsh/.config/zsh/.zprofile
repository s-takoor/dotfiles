# -- PACKAGE MANAGER -- #
eval "$(/opt/homebrew/bin/brew shellenv)" eval export HOMEBREW_PREFIX="/opt/homebrew";

# -- LANG -- #
export LANG=en_US.UTF-8

# -- FZF -- #
export FZF_DEFAULT_COMMAND="fd . $HOME"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="--preview 'bat -n --color=always {}' --bind 'ctrl-/:change-preview-window(down|hidden|)'"
export FZF_CTRL_R_OPTS="--exact"
export FZF_TMUX_OPTS="-p70%,50%"
