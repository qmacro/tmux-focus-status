#!/usr/bin/env bash

focus_status_file() {
    local default="$HOME/.focus-status"
    local value
    value="$(tmux show-option -gqv "@focus-status-file")"
    echo "${value:-$default}"
}

tmux set-option -g status-left-length 100
tmux set-option -g status-right ""
tmux set-option -g status-justify right
tmux set-option -g status-style "fg=grey,bg=terminal"
tmux set-option -g window-status-style "dim"
tmux set-option -g status-left "#(head -1 "$(focus_status_file)" 2> /dev/null)"
