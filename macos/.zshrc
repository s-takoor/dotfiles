# zshoptions
setopt autocd extendedglob nomatch menucomplete
setopt interactive_comments

# colors
autoload -Uz colors && colors

# completions
autoload -Uz compinit
zstyle ':completion:*' menu select
zstyle ':completion:*' complete-options true

# compinit
_comp_options+=(globdots)   # include hidden files

# custom_prompt
PROMPT="%B%{$fg[blue]%}[%{$fg[white]%}shashi%{$fg[red]%}@%{$fg[white]%}mac%{$fg[blue]%}] %(?:%{$fg_bold[green]%} :%{$fg_bold[red]%} )%{$fg[cyan]%} %c %{$reset_color%}"

# aliases
alias ba='brew autoremove'
alias bc='brew cleanup'
alias bl='brew list'
alias bu='brew update && brew upgrade'
alias cat='bat --color=always'
alias df='df -h'
alias la='exa -a --icons --color=always --group-directories-first'
alias ll='exa -l --icons --color=always'
alias ls='exa -al --icons --color=always --group-directories-first'
alias lt='exa -aT --color=always'
alias t='htop'
alias v='nvim'
alias vh='nvim .zsh_history'
alias vim='nvim'

# zoxide
eval "$(zoxide init zsh)"

# zsh-autosuggestions
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# zsh-syntax-highlighting
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# environment_variables
export PATH="$HOME/.emacs.d/bin:$PATH"
export PATH="/Users/shashiduth.takoor/Library/Python/3.9/bin:$PATH"
