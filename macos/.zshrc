# CUSTOM PROMPT
autoload -Uz vcs_info
autoload -U colors && colors

zstyle ':vcs_info:*' enable git 

precmd_vcs_info() { vcs_info }
precmd_functions+=( precmd_vcs_info )
setopt prompt_subst

zstyle ':vcs_info:git*+set-message:*' hooks git-untracked
# 
+vi-git-untracked(){
    if [[ $(git rev-parse --is-inside-work-tree 2> /dev/null) == 'true' ]] && \
        git status --porcelain | grep '??' &> /dev/null ; then
        hook_com[staged]+='!' # signify new files with a bang
    fi
}

zstyle ':vcs_info:*' check-for-changes true
zstyle ':vcs_info:git:*' formats " %{$fg[blue]%}(%{$fg[red]%}%m%u%c%{$fg[yellow]%}%{$fg[magenta]%} %b%{$fg[blue]%})%{$reset_color%}"

PROMPT="%B%{$fg[blue]%}[%{$fg[white]%}shashi%{$fg[red]%}@%{$fg[white]%}mac%{$fg[blue]%}] %(?:%{$fg_bold[green]%} :%{$fg_bold[red]%} )%{$fg[cyan]%} %c %{$reset_color%}"
PROMPT+="\$vcs_info_msg_0_ "

# ALIASES
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
alias zhist='nvim .zsh_history'
alias zprofile='nvim .zprofile'
alias zshrc='nvim .zshrc'
alias vim='nvim'
alias vi='nvim'
alias ..='z ..'

# EXPORTS
# ZOXIDE
eval "$(zoxide init zsh)"

# BUN
export BUN_INSTALL="$HOME/.bun"
export PATH="$BUN_INSTALL/bin:$PATH"

# BUN COMPLETION
[ -s "/Users/shashiduth.takoor/.bun/_bun" ] && source "/Users/shashiduth.takoor/.bun/_bun"

# TERRAFORM COMPLETION
autoload -U +X bashcompinit && bashcompinit
complete -o nospace -C /opt/homebrew/bin/terraform terraform

# PLUGINS
# AUTOSUGGESTIONS
[ -f ~/.config/zsh/plugins/autosuggestions.zsh ] && source ~/.config/zsh/plugins/autosuggestions.zsh

# BREW
[ -f ~/.config/zsh/plugins/brew.zsh ] && source ~/.config/zsh/plugins/brew.zsh

# COMPLETIONS
[ -f ~/.config/zsh/plugins/completions.zsh ] && source ~/.config/zsh/plugins/completions.zsh

# FZF
[ -f ~/.config/zsh/plugins/fzf.zsh ] && source ~/.config/zsh/plugins/fzf.zsh

# HISTORY SUBSTRING SEARCH
[ -f ~/.config/zsh/plugins/history-susbtring-search.zsh ] && source ~/.config/zsh/plugins/history-substring-search.zsh

# VI-MODE
[ -f ~/.config/zsh/plugins/vi-mode.zsh ] && source ~/.config/zsh/plugins/vi-mode.zsh

# AUTOPAIR
[ -f ~/.config/zsh/plugins/autopair.zsh ] && source ~/.config/zsh/plugins/autopair.zsh
