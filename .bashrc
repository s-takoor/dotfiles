#
# ~/.bashrc
#

# If not running interactively, don't do anything
[[ $- != *i* ]] && return

PS1='[\u@\h \W]\$ '

# Random color scripts
colorscript random

# Neofetch
#neofetch

# Starship prompt
eval "$(starship init bash)"

# Aliasaes
# "cat" to "bat"
alias cat='bat --color=always'

# "ls" to "exa"
alias ls='exa -al --icons --color=always --icons --group-directories-first'
alias la='exa -a --icons --color=always --group-directories-first'
alias ll='exa -l --color=always'
alias lt='exa -aT --color=always'

# power
alias pow='poweroff'

# update
alias pacu='sudo pacman -Syyu'
alias parup='paru -Syu --noconfirm'

# df
alias df='df -h'

# emacsclient
alias emacs="emacsclient -c -a 'emacs'"

# mount internal hdd
alias ud='udisksctl mount -b /dev/sdb1'

# ps
alias ps='ps auxf'

# alias tree
alias tree="exa -a --color=always --icons --group-directories-first -T"

# JAVA Classpath
alias jc='javac --class-path /usr/share/java/mariadb-jdbc/mariadb-java-client.jar'
alias ja='java -classpath /usr/share/java/mariadb-jdbc/mariadb-java-client.jar'

# luamake
alias luamake=/home/lt/.config/nvim/lua-language-server/3rd/luamake/luamake

# xmonad recompile
alias xr='xmonad --recompile'

# Exporting path to binaries
export PATH="~/.local/bin:$PATH"
export PATH="~/.emacs.d/bin:$PATH"
export PATH="$HOME/.emacs.d/bin:$PATH"


# BEGIN_KITTY_SHELL_INTEGRATION
if test -n "$KITTY_INSTALLATION_DIR" -a -e "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; then source "$KITTY_INSTALLATION_DIR/shell-integration/bash/kitty.bash"; fi
# END_KITTY_SHELL_INTEGRATION
