function open-db-dir() {
    tmux new-window "cd $DB_DIR && nvim '+Telescope git_files'"
}

function todo-db() {
    rg todo "$DB_DIR" -N
}
