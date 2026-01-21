#!/usr/bin/env bash
if ! $SHARE; then 
  SHARE="$( tmux show -gqv @CHER )"
  source "$SHARE/dump.fun"
  source "$SHARE/fatal.fun"
  source "$SHARE/yaml2arr.fun"
fi

dump ">> gruvbox-test.sh running..."
