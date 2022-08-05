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
