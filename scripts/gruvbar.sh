#!/usr/bin/env bash
LOCAL_ROOT="$1" || fatal "missing arg: LOCAL ROOT"
SHARE="$( tmux show -gqv @CHER )"

# include helper functions
source "$SHARE/dump.fun"
source "$SHARE/fatal.fun"
source "$SHARE/yaml2item.fun"
source "$SHARE/yaml2opt.fun"

main () 
{
  local gb_root="$1"
  local colors="$( tmux show -gqv '@COLORS' )"
  local icons="$( tmux show -gqv '@ICONS' )"
  yaml2opt ".icons.sys" "$icons"
  yaml2opt ".gruvbox_colors.*" "$colors"
  ## load base status bar format
  tmux run  "$gb_root/lib/formats/status-overrides.sh"
  tmux run  "$gb_root/lib/formats/status.sh"
}

main "$LOCAL_ROOT"
