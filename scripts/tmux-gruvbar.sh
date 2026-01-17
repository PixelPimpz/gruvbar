#!/usr/bin/env bash
LOCAL_ROOT="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
YQ="/usr/bin/yq"

# include helper functions
source "$LOCAL_ROOT/lib/share/dump.fun"
source "$LOCAL_ROOT/lib/share/fatal.fun"

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
  dump ">> new-gruv running..."
  local colors="$( tmux show -gqv '@COLORS' )"
  local icons="$( tmux show -gqv '@ICONS' )"
  optionsFromYaml "$colors" ".colors"
  optionsFromYaml "$icons" ".icons.sys"

  ## load base status bar format
  tmux run  "$LOCAL_ROOT/lib/formats/status-overrides.sh"
  ## load units 
  #tmux run "$LOCAL_ROOT/units/nvim-info.unit"
  
  tmux set -u @LOCAL_ROOT
}

main
