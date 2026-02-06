#!/usr/bin/env bash
LOCAL_ROOT="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
tmux source-file "$LOCAL_ROOT/lib/hooks.conf"

## bind [CTRL]+t to run this program and view the developer output
tmux bind C-t run "$LOCAL_ROOT/scripts/gruvbar.sh $LOCAL_ROOT"

## run main plugin script
tmux run "$LOCAL_ROOT/scripts/gruvbar.sh $LOCAL_ROOT"
