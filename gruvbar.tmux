#!/usr/bin/env bash
LOCAL_ROOT="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
tmux set -g '@LOCAL_ROOT' "$LOCAL_ROOT"
tmux set -g '@TSTAMP' '+%d%m%y:%H%M%S.%3N'
tmux set -g '@LOCAL_LOG' "/tmp/gruvbar.log"

## bind [CTRL]+t to run this program and view the developer output
tmux bind C-t run "$LOCAL_ROOT/scripts/gruvbar.sh "

## run main plugin script
tmux run "$LOCAL_ROOT/scripts/gruvbar.sh"
