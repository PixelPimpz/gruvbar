#!/usr/bin/env bash
dump() {
  local M="$1"
  local tstamp="$( tmux show -gqv @TSTAMP)"
  ## if log file doesnt exist or is empty, start a new or overwrite existing 
  #  file with a greeting
  [[ ! -f "$LOG" || -z "$LOG" ]] && echo "tmux-new-gruv log" > "$LOG" 

  if [[ "$( tmux show -gqv @DEBUG )" == true ]]; then
    local out=$(printf "%s: %s\n" "$( date "$tstamp" )" "$M" ) 
    echo "$out" >> "$LOG" 
    tmux display -p "${out}" 
  fi
}
