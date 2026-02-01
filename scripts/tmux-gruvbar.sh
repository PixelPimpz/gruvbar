#!/usr/bin/env bash
LOCAL_ROOT="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
LOCAL_ROOT="${LOCAL_ROOT%\/*}"
SHARE="$( tmux show -gqv @CHER )"

# include helper functions
source "$SHARE/dump.fun"
source "$SHARE/fatal.fun"
source "$SHARE/yaml2item.fun"
source "$SHARE/yaml2opt.fun"

main () 
{
  dump ">> gruvbar running..."
  local colors="$( tmux show -gqv '@COLORS' )"
  local icons="$( tmux show -gqv '@ICONS' )"
  yaml2opt ".icons.sys" "$icons"
  yaml2opt ".gruvbox_colors.*" "$colors"
  ## load base status bar format
  tmux run  "$LOCAL_ROOT/lib/formats/status-overrides.sh"
  tmux run  "$LOCAL_ROOT/lib/formats/status.sh"
}

main
