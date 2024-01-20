# -- ZDOTDIR -- #
export ZDOTDIR="$HOME/.config/zsh"

# -- TERMINAL -- #
export TERMINAL="alacritty"

# -- EDITOR -- #
# export EDITOR="emacsclient"
export VISUAL=vim

# -- EMACS -- #
export PATH="$HOME/.emacs.d/bin:$PATH"

# -- PATH -- #
# -- HOMEBREW -- #
export HOMEBREW_CELLAR="/opt/homebrew/Cellar";
export HOMEBREW_REPOSITORY="/opt/homebrew";
export PATH="/opt/homebrew/bin:/opt/homebrew/sbin${PATH+:$PATH}";
export MANPATH="/opt/homebrew/share/man${MANPATH+:$MANPATH}:";
export INFOPATH="/opt/homebrew/share/info:${INFOPATH:-}";

# -- BUN -- #
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# -- CARGO -- #
export PATH="$HOME/.cargo/env:$PATH"
export PATH="$HOME/.cargo/bin:$PATH"

# -- JAVA -- #
export PATH="/opt/homebrew/opt/openjdk/bin:$PATH"
export PATH="/opt/homebrew/opt/java/bin:$PATH"

# -- grep -- #
export PATH="/opt/homebrew/opt/grep/libexec/gnubin:$PATH"
