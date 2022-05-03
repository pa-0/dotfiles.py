# source: https://github.com/junegunn/fzf/wiki/Examples#tmux
# tm - create new tmux session, or switch to existing one. Works from within tmux too. (@bag-man)
# `tm` will allow you to select your tmux session via fzf.
# `tm irc` will attach to the irc session (if it exists), else it will create it.

tm() {
    local TMUX_CONFIG=$DOTFILES/tmux/tmux.conf
    local session
    session=$1
    [[ -n $TMUX ]] && change="switch-client" || change="attach-session"
    if [ "$session" ]; then
        tmux -f "$TMUX_CONFIG" "$change" -t "$1" 2>/dev/null ||
            (tmux -f "$TMUX_CONFIG" new-session -d -s "$1" &&
                tmux -f "$TMUX_CONFIG" "$change" -t "$1")
        return
    fi

    # otherwise, use the usual fzf script to attach to one or complaint there's no sessions
    session=$(
        tmux -f TMUX_CONFIG list-sessions -F "#{session_name}" 2>/dev/null |
            fzf --select-1 --exit-0 --height "$(tmux -f "$TMUX_CONFIG" list-sessions | wc -l)"
    ) &&
        tmux -f "$TMUX_CONFIG" "$change" -t "$session" || echo "No sessions found."
    unset TMUX_CONFIG
    unset session
}

fzf-select-window() {
    local window_index
    window_index=$(tmux list-windows -F "#I: #W" | fzf-tmux | cut -d ":" -f 1)
    test $window_index && tmux select-window -t ${window_index}
}

fzf-new-window-choose-dir() {
    tmux new-window -c "$(fzf-choose-dir)"
}
