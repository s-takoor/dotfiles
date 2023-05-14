# HOMEBREW
eval "$(/opt/homebrew/bin/brew shellenv)" eval export HOMEBREW_PREFIX="/opt/homebrew";
export HOMEBREW_CELLAR="opt/homebrew/Cellar";
export HOMEBREW_REPOSITORY="/opt/homebrew";
export PATH="/opt/homebrew/bin:/opt/homebrew/sbin${PATH+:$PATH}";
export MANPATH="/opt/homebrew/share/man${MANPATH+:$MANPATH}:";
export INFOPATH="/opt/homebrew/share/info:${INFOPATH:-}";

# EMACS
export PATH="$HOME/.emacs.d/bin:$PATH"

# LANG
export LANG=en_US.UTF-8

# FZF
export FZF_DEFAULT_COMMAND="fd . $HOME"
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"
export FZF_CTRL_T_OPTS="--preview 'bat -n --color=always {}' --bind 'ctrl-/:change-preview-window(down|hidden|)'"
export FZF_CTRL_R_OPTS="--reverse --exact"
export FZF_TMUX_OPTS="-p70%,50%"
