function open-db-dir() {
    tmux new-window -c "$DB_DIR"
}

function todo-db() {
    rg todo "$DB_DIR" -N
}
