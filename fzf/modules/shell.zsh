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
