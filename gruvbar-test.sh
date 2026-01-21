#!/usr/bin/env bash
COLORS2="$( tmux show -gqv @COLORS2 )"
ICONS="$( tmux show -gqv @ICONS )"
SHARE="$( tmux show -gqv @CHER )"
source "$SHARE/dump.fun"
source "$SHARE/fatal.fun"
source "$SHARE/yaml2arr.fun"

dump ">> gruvbox-test.sh running..."
dump ">> COLORS: $COLORS2"
yq eval ".gruvbox_colors.*.*" "$COLORS2"
