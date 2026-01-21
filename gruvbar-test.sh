#!/usr/bin/env bash
SHARE="$( tmux show -gqv @CHER )"
source "$SHARE/dump.fun"
source "$SHARE/fatal.fun"
source "$SHARE/yaml2arr.fun"

dump ">> gruvbox-test.sh running..."
