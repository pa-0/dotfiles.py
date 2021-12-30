#! /usr/bin/bash

GIT_PAGER=$(command -v delta)
DEFAULT_COLS=150

git_pager() {
    local opts
    local extra_opts
    opts="-w $DEFAULT_COLS"
    extra_opts=""
    if [[ "$COLUMNS" -ge "$DEFAULT_COLS" ]]; then
        extra_opts="--side-by-side"
    else
        extra_opts="--line-numbers"
    fi

    $GIT_PAGER "$opts" "$extra_opts"
}

git_pager "$@"
