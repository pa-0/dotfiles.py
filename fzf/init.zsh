# Settings and functions for FZF

# Setting fd as the default source for fzf
export FZF_DEFAULT_COMMAND='fd'

# To apply the command to CTRL-T as well
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

# Custom fzf window height
FZF_HEIGHT_WINDOW="50"

# source: https://junegunn.kr/2016/07/fzf-git/
is_in_git_repo() {
  git rev-parse HEAD > /dev/null 2>&1
}

# Default FZF opts and parameters
fzf-window () {
    fzf --height $FZF_HEIGHT_WINDOW% -m --exit-0 --preview $preview_cmd
}

# source: https://github.com/junegunn/fzf/wiki/Examples#tmux
# tm - create new tmux session, or switch to existing one. Works from within tmux too. (@bag-man)
# `tm` will allow you to select your tmux session via fzf.
# `tm irc` will attach to the irc session (if it exists), else it will create it.

if [ "$(command -v tmux)" ]
then
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
fi

gsw () {
    # Check if we are in a git repo
    is_in_git_repo || return
    # If no arguments are provided use fzf to select a branch
    if [ $1 ]
    then
        git switch "$@"
        return
    fi

    # TODO: Add scrolling for the preview
    preview_cmd='git lol --color=always -20 {+1}'
    target_branch=$( \
        git branch --list | grep -oP "^\s+\K.+$" | fzf-window \
    ) && \
        git switch $target_branch
}

gsh () {
    # Nothing to see here, move along
    is_in_git_repo || return
    # Pass the output of git lol to fzf to check changes
    # TODO: Add scrolling for the preview
    preview_cmd='git show --pretty=short --abbrev-commit --color=always {1}'
    git log --oneline --color=always "$@" | \
        fzf --reverse --ansi --preview $preview_cmd --preview-window=right:50%
}

alias gshd='gsh develop..HEAD'


git_restore_files () {
    # TODO: Add scrolling for the preview
    preview_cmd='git diff --color=always {+1}'
    git status -s | grep -oP "M\s+\K.+" | fzf-window --layout=reverse -m
}

gr () {
    is_in_git_repo || return
    git restore $(git_restore_files)
}

grs () {
    is_in_git_repo || return
    git restore --staged $(git_restore_files)
}

# Open nvim with file(s)
vo () {
    # TODO: Take whatever parameters this function could be run with and use them in fzf directly
    # Additionally, if there's a match, use that file directly
    # TODO: Add scrolling for the preview
    preview_cmd='bat --theme base16 --number --color=always --paging never {+1}'
    target_file=$(fd -t f -L -H -E .git/ | fzf-window) && \
        nvim -O $target_file
}

# Navigate to cirectory from anywhere
cf () {
    preview_cmd='exa --icons -T -L 1 --group-directories-first --git --git-ignore --colour=always {+1}'
    target_dir=$(fd --full-path $HOME -t d $HOME -L | fzf-window) && \
        cd $target_dir
}
