#!/usr/bin/env bash
set -euxo pipefail

export LC_ALL=en_US.UTF-8

# Set the maximum length of the left component of the status line. The default is 10.
tmux set-option -g status-left-length 100
# Set the maximum length of the right component of the status line. The default is 40.
tmux set-option -g status-right-length 100

# message styling
tmux set-option -g message-style "bg=blue,fg=black,bold"

# pane border color
tmux set-option -g pane-active-border-style "fg=blue"
tmux set-option -g pane-border-style "#{?pane_synchronized,fg=blue,fg=brightblack}"

# status bar
tmux set-option -g status-style "bg=default,fg=white"

### Left side
tmux set-option -g status-left "#[fg=black,bold]#{?client_prefix,#[bg=yellow],#[bg=brightblue]}   #S #[bg=default]#{?client_prefix,#[fg=yellow],#[fg=brightblue]}  "
# tmux set-option -g status-left "#[bg=default,bold]#{?client_prefix,#[fg=yellow],#[fg=blue]}   #S    "

### Windows list
# tmux set-window-option -g window-status-format " #[bg=default,fg=white]#{?window_last_flag, , }#I #{?window_zoomed_flag, , }#W"
# tmux set-window-option -g window-status-current-format "#[bg=default,fg=blue]  #I #{?window_zoomed_flag, , }#W"
tmux set-window-option -g window-status-format "#[bg=default]#{?window_bell_flag,#[fg=red],#[fg=white]}#I#{?window_last_flag,∙, }#{?window_zoomed_flag, ,#{?window_bell_flag, , }}#W"
tmux set-window-option -g window-status-current-format "#[bg=default,fg=blue]#I∙#{?window_zoomed_flag, , }#W"
tmux set-window-option -g window-status-separator "  "

### Right side
tmux set-option -g status-right " 󰃰  %a %b %d %Y %H:%M "
