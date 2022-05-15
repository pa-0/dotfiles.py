# source: https://junegunn.kr/2016/07/fzf-git/
is-in-git-repo() {
    git rev-parse --is-inside-work-tree &>/dev/null
}

fzf-git-restore-files() {
    git status -s | grep -oP "$1" |
        fzf-tmux \
            --header "Select a file" \
            -m
}

fzf-git-choose-branch() {
    git branch --list | grep -oP "^\s+\K.+$" |
        fzf-tmux \
            --header "Select a branch" \
            --preview 'git lol --color=always -20 {+1}'
}

gr() {
    is-in-git-repo || return
    git restore "$(
        fzf-git-restore-files "^\sM\s+\K.+" \
            --preview 'git diff --color=always {+1} | delta'
    )"
}

grs() {
    is-in-git-repo || return
    git restore --staged "$(
        fzf-git-restore-files "^M[\sMD]+\K.+" \
            --preview 'git diff --staged --color=always {+1} | delta'
    )"
}

fzf-git-switch-branch() {
    is-in-git-repo || return
    zle push-line
    local target_branch
    target_branch=$(fzf-git-choose-branch) &&
        test $target_branch &&
        git switch "$target_branch"
    zle reset-prompt
}
