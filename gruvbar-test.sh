#!/usr/bin/env bash
COLORS2="$( tmux show -gqv @COLORS2 )"
ICONS="$( tmux show -gqv @ICONS )"
SHARE="$( tmux show -gqv @CHER )"
source "$SHARE/dump.fun"
source "$SHARE/fatal.fun"
source "$SHARE/yaml2arr.fun"

dump ">> gruvbox-test.sh running..."
dump ">> COLORS: $COLORS2"
main() {
  local colors=()
  yq eval ".gruvbox_colors.*.* | to_entries[] | ( .key + \"=\" + .value )" "$COLORS2" |
    while IFS="=" read -r key value; do
      dump "${key}:${value}"
    done
  dump "${colors[@]}"
}
main
