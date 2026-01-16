#!/usr/bin/env bash
LOCAL_ROOT="$( tmux show -gqv @LOCAL_ROOT )"
source "$LOCAL_ROOT/lib/share/dump.fun"
dump ">> status overrides"
tmux set -g status-justify centre
tmux set -g status-style bg=#{@Dark0_H},fg=#{@Light0_S}
tmux set -g window-status-current-style bg=#{@Dark0_H},fg=#{@DarkOrange}

