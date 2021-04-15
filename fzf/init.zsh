# Settings and functions for FZF

# Shell key bindgins for fedora systems
[[ "$(uname -r | grep -oP 'fc\d{2}')" ]] && source /usr/share/fzf/shell/key-bindings.zsh

# Setting fd as the default source for fzf
export FZF_DEFAULT_COMMAND='fd'

# Default options for all fzf calls
export FZF_DEFAULT_OPTS="--ansi --reverse --border --height 80%"

# To apply the command to CTRL-T as well
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# FZF columns for things like delta
export FZF_PREVIEW_COLUMNS=120

# source: https://junegunn.kr/2016/07/fzf-git/
is_in_git_repo() {
  git rev-parse --is-inside-work-tree &> /dev/null
}

_git_restore_files () {
    # TODO: Add scrolling for the preview
    git status -s | grep -oP "$RE_FILES" | _fzf_window --layout=reverse -m $@
}
# Default FZF opts and parameters
_fzf_window () {
    local query
    [[ "$querystring" ]] && query="-q ${querystring}"
    fzf-tmux --exit-0 --preview $preview_cmd --select-1 $query $@
}

_fzf_choose_branch () {
    local preview_cmd='git lol --color=always -20 {+1}'
    git branch --list | grep -oP "^\s+\K.+$" | _fzf_window --height 80% --preview-window=down:75%
}

# source: https://github.com/junegunn/fzf/wiki/Examples#tmux
# tm - create new tmux session, or switch to existing one. Works from within tmux too. (@bag-man)
# `tm` will allow you to select your tmux session via fzf.
# `tm irc` will attach to the irc session (if it exists), else it will create it.

if [ "$(command -v tmux)" ]
then
    tm () {
        local TMUX_CONFIG=$DOTFILES/tmux/tmux.conf
        [[ -n "$TMUX" ]] && change="switch-client" || change="attach-session"
        if [ $1 ]; then
            tmux -f $TMUX_CONFIG $change -t "$1" 2>/dev/null || \
                (tmux -f $TMUX_CONFIG new-session -d -s $1 && \
                    tmux -f $TMUX_CONFIG $change -t "$1"); return
        fi

        session=$(tmux -f TMUX_CONFIG list-sessions -F "#{session_name}" 2>/dev/null | \
            fzf --select-1 --exit-0 --height $(tmux -f $TMUX_CONFIG list-sessions | wc -l) \
        ) && \
        tmux -f $TMUX_CONFIG $change -t "$session" || echo "No sessions found."
    }
fi

gsw () {
    # Check if we are in a git repo
    is_in_git_repo || return
    target_branch=$(_fzf_choose_branch) && git switch "$target_branch"
}

gr () {
    is_in_git_repo || return
    local RE_FILES="^\sM\s+\K.+"
    local preview_cmd='git diff --color=always {+1}'
    git restore $(_git_restore_files)
}

grs () {
    is_in_git_repo || return
    local RE_FILES="^M[\sMD]+\K.+"
    local preview_cmd='git diff --staged --color=always {+1}'
    git restore --staged $(_git_restore_files)
}


# Open nvim with file(s)
vo () {
    # TODO: Add scrolling for the preview
    local querystring
    [[ "$@" ]] && querystring="$@"
    preview_cmd='bat --number --color=always --paging never {+1}'
    # TODO: Figure out how to open multiple files at once in separate splits
    # Hint: paste -sd " " - will join outputs into a single line
    target_file=$(fd -t f -L -H -E .git/ | _fzf_window ) && nvim $target_file
}

# Navigate to cirectory from anywhere
cf () {
    local querystring
    [[ "$@" ]] && querystring="$@"
    preview_cmd='exa --icons -T -L 1 --group-directories-first --git --git-ignore --colour=always {+1}'
    target_dir=$(fd --full-path $HOME -t d $HOME -L | _fzf_window) && \
        cd $target_dir
}
