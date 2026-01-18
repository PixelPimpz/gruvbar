#!/usr/bin/env bash
LOCAL_ROOT="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
LOCAL_ROOT="${LOCAL_ROOT%\/*\/*}"
SHARE="$( tmux show -gqv @CHER )"
## include dependencies
source "$SHARE/lib/share/dump.fun"
source "$SHARE/lib/share/fatal.fun"

dump ">> LOCAL_ROOT: $LOCAL_ROOT"
dump ">> SHARE: $SHARE"
