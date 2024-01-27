# -- COMPLETIONS -- #
autoload -Uz compinit
compinit
zstyle ':completion:*' menu select

zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

zstyle ':completion:*' complete-options true
zmodload zsh/complist

_comp_options+=(globdots)
setopt GLOB_COMPLETE

setopt AUTO_LIST
setopt COMPLETE_IN_WORD

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=36=31'
zstyle ':completion:*:matches' original 'yes'
zstyle ':completion:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=36=31'
zstyle ':completion:*' list-colors '=(#b) #([0-9]#)*=36=31'
zstyle ':completion:*:default' list-colors '=(#b) #([0-9]#)*=36=31'

zstyle ':completion:*' completer _complete _approximate
zstyle ':completion:*' format '%B%d%b'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' list-colors '=(#b) #([0-9]#)*=36=31'

zle -C fzf-completion complete-word _generic
bindkey '^T' fzf-completion

