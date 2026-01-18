#!/usr/bin/env bash
LOCAL_ROOT="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
LOCAL_ROOT="${LOCAL_ROOT%\/*\/*}"
SHARE="$( tmux show -gqv @CHER )/lib/share"
## include dependencies
source "$SHARE/dump.fun"
source "$SHARE/fatal.fun"

dump "hello dumpling"
#dump ">> $LOCAL_ROOT"
#dump ">> $SHARE"
