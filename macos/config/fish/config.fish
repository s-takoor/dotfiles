if status is-interactive
    # Commands to run in interactive sessions can go here
end

# EXPORT
set fish_greeting
set TERM "xterm-256color"
set -U EDITOR "nvim"

# MANPAGER
set -x MANPAGER "sh -c 'col -bx | bat -l man -p'"

# VI MODE
function fish_user_key_bindings
  fish_vi_key_bindings
end

# ALIASES
alias sync "doom sync && doom doctor"
alias purge "brew autoremove && brew cleanup"
alias list "brew list"
alias update "brew update && brew upgrade"
alias cat "bat --color=always"
alias fish "nvim .config/fish/config.fish"
alias grep "grep --color=auto"
alias df "df -h"
alias la "exa -a --icons --color=always --group-directories-first"
alias ll "exa -l --icons --color=always"
alias ls "exa -al --icons --color=always --group-directories-first"
alias lt "exa -aT --color=always"
alias init "podman machine init"
alias start "podman machine start"
alias info "podman info"
alias img "podman images -a"
alias rmi "podman rmi --force"
alias build "podman build --arch=amd64 --tag"
alias strg "podman ps --all --storage"
alias run "podman run --rm -it --arch=amd64"
alias prune "podman system prune"
alias psa "podman ps -a"
alias pull "podman pull"
alias py "python3"
alias reboot "sudo reboot"
alias src "source .zshrc"
alias top "htop"
alias hist "nvim .zsh_history"
alias profile "nvim .zprofile"
alias zsh "nvim .zshrc"
alias vim "nvim"
alias v "nvim"
alias .. "z .."

# ZOXIDE
zoxide init fish | source
