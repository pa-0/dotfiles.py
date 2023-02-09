# Settings and functions for FZF

# Setting fd as the default source for fzf
export FZF_DEFAULT_COMMAND='fd'

# Default options for all fzf calls
export FZF_DEFAULT_OPTS="--ansi --reverse --border --height 80% --exact --preview-window=right:50%"

# To apply the command to CTRL-T as well
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# source: https://junegunn.kr/2016/07/fzf-git/
is-in-git-repo() {
    git rev-parse --is-inside-work-tree &>/dev/null
}

gr() {
    is-in-git-repo || return
    git restore $(
        git ls-files --modified |
            fzf \
                --header "Select a file" \
                -m \
                --preview 'git diff {+1} | delta'
    )
}

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
    window_index=$(tmux list-windows -F "#I: #W" | fzf | cut -d ":" -f 1)
    test $window_index && tmux select-window -t ${window_index}
    zle reset-prompt
}

fzf-new-window-choose-dir() {
    local target_dir
    target_dir="$(fzf-choose-dir)" &&
        test "$target_dir" &&
        tmux new-window -c "$target_dir"
    zle reset-prompt
}

fzf-open-file-in-editor() {
    local target_file
    # TODO: Figure out how to open multiple files at once in separate splits
    # Hint: paste -sd " " - will join outputs into a single line
    target_file=$(
        fd -t f -L -H -E .git/ |
            fzf \
                --header "Select a file" \
                --preview 'bat --number --color=always --paging never {+1}'
    ) &&
        test "$target_file" &&
        "${EDITOR}" "$target_file"
    zle reset-prompt
}

fzf-choose-dir() {
    local target_dir
    target_dir=$(
        z | awk '{print $2}' |
            fzf \
                --tac \
                --header "Select a directory" \
                --preview 'exa --icons -T -L 1 --group-directories-first --git --git-ignore --colour=always {+1}'
    ) &&
        test "$target_dir" &&
        echo "$target_dir"
}

fzf-cd-to-dir() {
    zle push-line
    local target_dir
    target_dir="$(fzf-choose-dir)" &&
        test "$target_dir" &&
        cd "$target_dir"
    zle reset-prompt

}

__file_name() {
    echo "$1" | cut -d ":" -f 1
}

__line_number() {
    echo "$1" | cut -d ":" -f 2
}

fzf-open-file-from-contents() {
    # Source: https://github.com/junegunn/fzf/wiki/Examples#searching-file-contents
    local match
    match=$(
        rg \
            --trim \
            --no-heading \
            . |
            fzf \
                --header "Search the contents" \
                --preview '
                    LINE=$(echo '{}' | cut -d ":" -f 2);
                    OFFSET=12
                    PREVIEW_LINE=$(( $LINE-$OFFSET < 0 ? 0 : $LINE-$OFFSET ))
                    FILENAME=$(echo '{}' | cut -d ":" -f 1)
                    bat $FILENAME \
                    --highlight-line $LINE \
                    --style full \
                    --color=always \
                    --line-range $PREVIEW_LINE:+$(( $OFFSET * 2 ))'
    )

    test ${match} &&
        $EDITOR $(__file_name $match) +$(__line_number $match)
}
