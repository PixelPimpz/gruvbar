#!/usr/bin/env bash
LOCAL_ROOT="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
LOCAL_ROOT="${LOCAL_ROOT%\/*}"
SHARE="$( tmux show -gqv @CHER )"
YQ="/usr/bin/yq"

# include helper functions
source "$SHARE/dump.fun"
source "$SHARE/fatal.fun"
source "$SHARE/yaml2opt.fun"

yaml2opt ".gruvbox_colors.*" "$LOCAL_ROOT/lib/gruvbox.yaml"

optionsFromYaml() 
{
  local yaml="$1"
  local filter="$2"

  ## verify yq binary or fatal()
  [[ ! -x ${YQ} ]] && fatal "unable to read .yaml. No executable for \"yq\" found."
  dump ">> yq executable found."

  # key value pairs to array
  yq eval "${filter} | to_entries[] | (.key + \"=\" + .value)" "$yaml" |
  while IFS="=" read -r key value; do
    tmux set -g "@$key" "$value"
    dump "$(tmux show -g @$key)"
  done
}

main () 
{
  dump ">> gruvbar running..."
  local colors="$( tmux show -gqv '@COLORS2' )"
  local icons="$( tmux show -gqv '@ICONS' )"
  #optionsFromYaml "$colors" ".gruvbox-colors.*"
  optionsFromYaml "$icons" ".icons.sys"
  ## load base status bar format
  tmux run  "$LOCAL_ROOT/lib/formats/status-overrides.sh"
  tmux run  "$LOCAL_ROOT/lib/formats/status.sh"
  
  tmux set -u @LOCAL_ROOT
}

main
