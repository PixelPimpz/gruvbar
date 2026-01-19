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
status-format[0] "#[align=left range=left #{E:status-left-style}]#[norange default]#[list=on align=#{status-justify}]#[list=left-marker]<#[list=right-marker]>#[list=on]#{W:#[range=window|#{window_index} #{E:window-status-style}#{?#{&&:#{window_last_flag},#{!=:#{E:window-status-last-style},default}}, #{E:window-status-last-style},}#{?#{&&:#{window_bell_flag},#{!=:#{E:window-status-bell-style},default}}, #{E:window-status-bell-style},#{?#{&&:#{||:#{window_activity_flag},#{window_silence_flag}},#{!=:#{E:window-status-activity-style},default}}, #{E:window-status-activity-style},}}]#[push-default]#{T:window-status-format}#[pop-default]#[norange default]#{?loop_last_flag,,#{window-status-separator}},#[range=window|#{window_index} list=focus #{?#{!=:#{E:window-status-current-style},default},#{E:window-status-current-style},#{E:window-status-style}}#{?#{&&:#{window_last_flag},#{!=:#{E:window-status-last-style},default}}, #{E:window-status-last-style},}#{?#{&&:#{window_bell_flag},#{!=:#{E:window-status-bell-style},default}}, #{E:window-status-bell-style},#{?#{&&:#{||:#{window_activity_flag},#{window_silence_flag}},#{!=:#{E:window-status-activity-style},default}}, #{E:window-status-activity-style},}}]#[push-default]#{T:window-status-current-format}#[pop-default]#[norange list=on default]#{?loop_last_flag,,#{window-status-separator}}}#[nolist align=right range=right #{E:status-right-style}]#[norange default]"
