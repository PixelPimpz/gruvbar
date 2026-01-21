#!/usr/bin/env bash
ICONS="$( tmux show -gqv @ICONS )"
SHARE="$( tmux show -gqv @CHER )"
source "$SHARE/dump.fun"
source "$SHARE/fatal.fun"
source "$SHARE/yaml2arr.fun"

dump ">> gruvbox-test.sh running..."
yq eval ".gruvbox_colors.*.*" "./lib/gruvbox.yaml"
