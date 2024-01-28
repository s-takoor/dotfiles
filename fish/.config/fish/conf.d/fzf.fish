set -Ux FZF_DEFAULT_OPTS "\
--exact \
--reverse \
--border rounded \
--no-info \
--pointer='> ' \
--marker=' ' \
--ansi \
--color='16,bg+:-1,gutter:-1,prompt:4,pointer:4,marker:6,border:4,label:4,header:italic'"

set -Ux FZF_TMUX_OPTS "-p 70%,50%"

set -Ux FZF_CTRL_R_OPTS "--border-label=' history ' \
--prompt=' '"
