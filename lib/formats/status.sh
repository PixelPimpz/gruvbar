#!/usr/bin/env bash
LOCAL_ROOT="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
LOCAL_ROOT="${LOCAL_ROOT%\/*\/*}"
SHARE="$( tmux show -gqv @CHER )"

set_left()
{
  dump ">>> lib/share/status:set_left() running..."
  tmux set -g status-left "#[fg=#{@green}]#{@HemiL}#[bg=#{@bg0},bold,reverse]#{E:@gitgud}#[noreverse]#{@TriangleR}"
  tmux set -ag status-left "#[fg=#{@bg2}]#{@TriangleLInverse}#[bg=#{@fg1},bold,reverse]#{E:@nvim-info} #[noreverse]#{@TriangleR}"
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
