# -- HOMEBREW CONFIGURATION -- #
eval (/opt/homebrew/bin/brew shellenv)

# -- FISH SHELL SETTINGS -- #
set -U fish_greeting
set -U fish_key_bindings fish_vi_key_bindings

# -- TERMINAL SETTINGS -- #
set -x TERMINAL "alacritty"

# -- MANPAGER -- #
set -x MANPAGER "nvim +Man!"

# -- PATH Settings -- #
# HOMEBREW
set -x HOMEBREW_CELLAR "/opt/homebrew/Cellar"
set -x HOMEBREW_REPOSITORY "/opt/homebrew"
set -x PATH "/opt/homebrew/bin" "/opt/homebrew/sbin" $PATH
set -x MANPATH "/opt/homebrew/share/man" $MANPATH
set -x INFOPATH "/opt/homebrew/share/info" $INFOPATH

# BUN
set -x BUN_INSTALL "$HOME/.bun"
set -x PATH "$BUN_INSTALL/bin" $PATH

# CARGO (RUST)
set -gx PATH "$HOME/.cargo/bin" $PATH

# JAVA
set -x PATH "/opt/homebrew/opt/openjdk/bin" $PATH
set -x PATH "/opt/homebrew/opt/java/bin" $PATH

# EMACS
set -x PATH "$HOME/.emacs.d/bin" $PATH

# -- EDITOR SETTINGS -- #
set -Ux EDITOR emacsclient

# -- utility settings -- #
# GREP
set -x PATH "/opt/homebrew/opt/grep/libexec/gnubin" $PATH

# STARSHIP PROMPT
starship init fish | source

# ZOXIDE
zoxide init fish | source

# -- ALIASES -- #
for file in ~/.config/fish/aliases/*.fish
    source $file
end

# HOMEBREW ALIASES
alias purge 'brew cleanup --prune=all'
alias list 'brew list'

# FILE-RELATED ALIASES
alias cat 'bat --color=always'
alias df 'df -h'
alias ls 'eza -al --icons --color=always --group-directories-first'
alias la 'eza -a --icons --color-always --group-directories-first'
alias ll 'eza -l --icons --color=always'
alias lt 'eza -aT --color=always'

# TEXT EDITOR ALIASES
alias vi 'nvim'
alias vim 'nvim'

# MISCELLANEOUS ALIASES
alias cp 'xcp'
alias cd 'z'

#RTX
mise activate fish | source
