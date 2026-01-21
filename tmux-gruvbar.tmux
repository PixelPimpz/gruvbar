#!/usr/bin/env bash
LOCAL_ROOT="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
tmux set -g '@LOCAL_ROOT' "$LOCAL_ROOT"
tmux set -g '@TSTAMP' '+%d%m%y:%H%M%S.%3N'
tmux set -g '@LOCAL_LOG' "/tmp/gruvbar.log"

## set option vars for icons and colors for easy access by 
#  scripts local to this plugin
tmux set -g '@ICONS'  "$LOCAL_ROOT/lib/icons.yaml"
tmux set -g '@COLORS' "$LOCAL_ROOT/lib/colors.yaml"

## bind [CTRL]+t to run this program and view the developer output
tmux bind C-t run "$LOCAL_ROOT/scripts/tmux-gruvbar.sh "
tmux bind C-9 run "$LOCAL_ROOT/gruvbar-test.sh"

## run main plugin script
tmux run "$LOCAL_ROOT/scripts/tmux-gruvbar.sh "
