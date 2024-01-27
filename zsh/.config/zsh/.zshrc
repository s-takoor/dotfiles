# -- COLORS -- #
autoload -Uz colors && colors

# -- CUSTOM PROMPT -- #
#PROMPT="%B%{$fg[blue]%}[%{$fg[white]%}st%{$fg[red]%}@%{$fg[white]%}mac%{$fg[blue]%}] %(?:%{$fg_bold[green]%} :%{$fg_bold[red]%} )%{$fg[cyan]%} %c %{$reset_color%}"

# -- HISTORY -- #
HISTSIZE=100000
SAVEHIST=100000
HISTFILE=~/.config/zsh/zsh_history

# -- ALIASES -- #
[ -f ~/.config/zsh/aliases.zsh ] && source ~/.config/zsh/aliases.zsh

# -- COMPLETIONS -- #
[ -f ~/.config/zsh/completions.zsh ] && source ~/.config/zsh/completions.zsh

# -- VI-MODE -- #
[ -f ~/.config/zsh/vi-mode.zsh ] && source ~/.config/zsh/vi-mode.zsh

# -- AUTO-SUGGESTIONS -- #
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# -- SYNTAX-HIGHLIGHTING -- #
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

[ -f ~/.config/zsh/.fzf.zsh ] && source ~/.config/zsh/.fzf.zsh

# -- STARSHIP -- #
eval "$(starship init zsh)"

# -- RTX -- #
eval "$(mise activate zsh)"

# -- ZOXIDE -- #
eval "$(zoxide init zsh)"

