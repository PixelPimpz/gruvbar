#!/usr/bin/env bash
LOCAL_ROOT="$( tmux show -gqv @LOCAL_ROOT )"
source "$LOCAL_ROOT/lib/share/dump.fun"
dump ">> status overrides called"
tmux set -g status-justify centre

