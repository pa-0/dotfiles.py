# Settings and functions for FZF

# Setting fd as the default source for fzf
export FZF_DEFAULT_COMMAND='fd'

# To apply the command to CTRL-T as well
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# source: https://junegunn.kr/2016/07/fzf-git/
is_in_git_repo() {
  git rev-parse HEAD > /dev/null 2>&1
}

# source: https://github.com/junegunn/fzf/wiki/Examples#tmux
# tm - create new tmux session, or switch to existing one. Works from within tmux too. (@bag-man)
# `tm` will allow you to select your tmux session via fzf.
# `tm irc` will attach to the irc session (if it exists), else it will create it.

tm () {
    [[ -n "$TMUX" ]] && change="switch-client" || change="attach-session"
    if [ $1 ]; then
        tmux $change -t "$1" 2>/dev/null || (tmux new-session -d -s $1 && tmux $change -t "$1"); return
    fi

    session=$(tmux list-sessions -F "#{session_name}" 2>/dev/null | \
        fzf --select-1 --exit-0 --height $(tmux list-sessions | wc -l) \
    ) && \
    tmux $change -t "$session" || echo "No sessions found."
}

gsw () {
    # Check if we are in a git repo
    is_in_git_repo || return
    # If no arguments are provided use fzf to select a branch
    if [ $1 ]
    then
        git switch "$@"
        return
    fi

    target_branch=$( \
        git branch --list | grep -oP "\w+$" | \
        fzf-tmux -d 40% --height 40% --exit-0 --preview 'git lol --color=always -20 {+1}' --preview-window=up:50% \
    ) && \
        git switch $target_branch
}

gsh () {
    # Nothing to see here, move along
    is_in_git_repo || return
    # Pass the output of git lol to fzf to check changes
    preview_cmd='git show --pretty=short --abbrev-commit --color=always {+1}'
    git log --oneline --color=always "$@" | \
        fzf --reverse --ansi --preview $preview_cmd --preview-window=right:50%
}

vo () {
    preview_cmd='bat --theme base16 --style=numbers --color=always --paging never {+1}'
    target_file=$(fd -t f -L -H -E .git/ | fzf-tmux -d 40% --height 40% --reverse --preview $preview_cmd) && \
        $EDITOR $target_file
}

cf () {
    preview_cmd='exa --icons -T -L 1 --group-directories-first --git --git-ignore --colour=always {+1}'
    target_dir=$(fd --full-path $HOME -t d $HOME -L | fzf-tmux -d 40% --height 40% --preview $preview_cmd) && \
        cd $target_dir
}
