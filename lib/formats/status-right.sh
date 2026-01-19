#!/usr/bin/env bash
LOCAL_ROOT="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
LOCAL_ROOT="${LOCAL_ROOT%\/*\/*}"
SHARE="$( tmux show -gqv @CHER )"

main()
{
  ## include dependencies
  source "$SHARE/lib/share/dump.fun"
  source "$SHARE/lib/share/fatal.fun"
  dump ">>> lib/share/status-right.sh running..."

  ## read the units and place them in their respective
  #  places
  tmux set -ag status-right "#{E:@nvim-info-unit}"
  tmux set -ag status-right "#{E:@clockette}"
  ## Data dumps for testing/debugging
  dump ">> SHARE: $SHARE"
}
 
main
