# zshoptions
setopt autocd extendedglob nomatch menucomplete
setopt interactive_comments

# colors
autoload -Uz colors && colors

# completions
autoload -Uz compinit
zstyle ':completion:*' menu select
zmodload zsh/complist
zstyle ':completion:*' complete-options true

# including hidden files
compinit
_comp_options+=(globdots)

# custom_prompt
PROMPT="%B%{$fg[blue]%}[%{$fg[white]%}shashi%{$fg[red]%}@%{$fg[white]%}mac%{$fg[blue]%}] %(?:%{$fg_bold[green]%} :%{$fg_bold[red]%} )%{$fg[cyan]%} %c %{$reset_color%}"

# aliases
alias sync='doom sync && doom doctor'
alias purge='brew autoremove && brew cleanup'
alias list='brew list'
alias update='brew update && brew upgrade'
alias cat='bat --color=always'
alias grep='grep --color=auto'
alias df='df -h'
alias la='exa -a --icons --color=always --group-directories-first'
alias ll='exa -l --icons --color=always'
alias ls='exa -al --icons --color=always --group-directories-first'
alias lt='exa -aT --color=always'
alias init='podman machine init'
alias start='podman machine start'
alias info='podman info'
alias img='podman images -a'
alias rmi='podman rmi --force'
alias build='podman build --arch=amd64 --tag'
alias strg='podman ps --all --storage'
alias run='podman run --rm -it --arch=amd64'
alias prune='podman system prune'
alias psa='podman ps -a'
alias pull='podman pull'
alias py='python3'
alias reboot='sudo reboot'
alias src='source .zshrc'
alias top='htop'
alias hist='nvim .zsh_history'
alias profile='nvim .zprofile'
alias zsh='nvim .zshrc'
alias vim='nvim'
alias v='nvim'
alias doom='doom sync && doom doctor'

# zoxide
eval "$(zoxide init zsh)"

# zsh-autosuggestions
source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh

# zsh-syntax-highlighting
source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# terraform autocompletion
autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /opt/homebrew/bin/terraform terraform

# FZF
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
