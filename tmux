#!/usr/bin/bash

DEFAULT_TMUX_WINDOW_NAME=dflt

tm(){
    tmux_window_name="$DEFAULT_TMUX_WINDOW_NAME"
	[[ $# -eq 0 ]] || tmux_window_name="$1"
    if [[ -z "$TMUX" ]]; then
        if tmux has-session -t $tmux_window_name 2>/dev/null; then
            tmux attach-session -t $tmux_window_name
        else
            tmux new -s $tmux_window_name
        fi
    fi
}
