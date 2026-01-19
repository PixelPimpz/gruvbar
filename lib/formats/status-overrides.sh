#!/usr/bin/env bash
# ------------------------------------------------------------
# | these overrides are for general status-bar settings ONLY |
# | any styles or formats for components (units) should be   | 
# | kept with the compunents themselves                      |
# ------------------------------------------------------------
LOCAL_ROOT="$( tmux show -gqv @LOCAL_ROOT )"
source "$LOCAL_ROOT/lib/share/dump.fun"
dump ">> status overrides"
tmux set -g status-justify centre
tmux set -g status-style bg=#{default},fg=#{@Light0_S}
tmux set -g window-status-style fg=#{@Dark4}
tmux set -g window-status-current-style fg=#{@Yellow},bold
tmux set -g window-status-last-style fg=#{@Orange}
tmux set -g window-status-activity-style bg=#{default},fg=#{default}
tmux set -g status-right-length 0
tmux set -g message-style "#[bg=default,fg=#{@Orange},align=centre]#{@Alert}
