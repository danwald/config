unbind-key -n C-a
set -g prefix ^A
set -g prefix2 ^A
bind a send-prefix

bind < resize-pane -L 10
bind > resize-pane -R 10
bind - resize-pane -D 10
bind + resize-pane -U 10
