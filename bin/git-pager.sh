#! /usr/bin/env bash

GIT_PAGER=$(command -v delta)
DEFAULT_COLS=161

delta-git-pager() {
    local opts
    local extra_opts
    opts="-w $DEFAULT_COLS"
    extra_opts="--line-numbers"

    $GIT_PAGER "$opts" "$extra_opts"
}

main() {
    if [[ $(command -v delta) ]]; then
        delta-git-pager "$@"
    else
        # Default to less if delta is not in PATH
        command less "$@"
    fi
}

main "$@"
