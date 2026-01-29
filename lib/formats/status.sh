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
  tmux set -ag status-right "#{E:@clockette}"
}

main()
{
  source "$SHARE/dump.fun"
  source "$SHARE/fatal.fun"
  set_right
  set_left
}
 
main
