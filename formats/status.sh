#!/usr/bin/env bash
LOCAL_ROOT="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
LOCAL_ROOT="${LOCAL_ROOT%\/*\/*}"
SHARE="$( tmux show -gqv @CHER )"
source "$SHARE/dump.fun"
source "$SHARE/fatal.fun"

set_left()
{
  tmux set -g status-left "#[fg=#{@blue}]#{@HemiL}#[bg=#{@fg1},bold,reverse]#{?@MF_GIT,#{E:@MF_GIT},---}#[bg=default,noreverse]#{@TriangleR}"
  #tmux set -g status-left "#[fg=#{@blue}]#{@HemiL}#[bg=#{@fg1},bold,reverse]#{E:@MF_GIT}#[bg=default,noreverse]#{@TriangleR}"
  tmux set -ag status-left "#[fg=#{@bg2}]#{@TriangleLInverse}#[bg=#{@fg1},bold,reverse] #{E:@MF_NAME} #[bg=default,noreverse]#{@HemiR}"
}

set_right()
{
  tmux set -g status-right "#[fg=#{@blue}]#{@HemiL}#[bg=#{@fg1},bold,reverse]#{E:@clockette} #[bg=default,noreverse]#{@TriangleR}"
  tmux set -ag status-right "#[fg=#{@aqua}]#{@TriangleLInverse}#[bg=#{@fg1},bold,reverse] #{E:@today}#[bg=default,noreverse]#{@HemiR}"
}

main()
{
  set_right
  set_left
}
 
main
