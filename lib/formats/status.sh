#!/usr/bin/env bash
LOCAL_ROOT="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
LOCAL_ROOT="${LOCAL_ROOT%\/*\/*}"
SHARE="$( tmux show -gqv @CHER )"

set_left()
{
  dump ">>> lib/share/status:set_left() running..."
  tmux set -g status-left "#{E:@Gitgud}"
}

set_right()
{
  dump ">>> lib/share/status:set_right() running..."
  tmux set -g status-right "#{E:@nvim-info-unit}"
  tmux set -ag status-right "#{T:@clockette}"
  tmux set -ag status-right "#{T:@calendar}"
}

main()
{
  source "$SHARE/lib/share/dump.fun"
  source "$SHARE/lib/share/fatal.fun"
  
  set_left
  set_right

  dump ">> SHARE: $SHARE"
}
 
main
