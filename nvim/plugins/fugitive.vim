map <leader>* :Ggrep --untracked <cword> <CR><CR>

command Gl Git pull
command Gp Git push
command Gpf Git push --force-with-lease
command Gca Git commit --amend
command Grb Git rebase
command Grbd Git rebase develop
command Grbid Git rebase develop --interactive
command Grbc Git rebase --continue
command Gwip Git wip
command Gsw GBranches
command Gsta Git stash push
command Gstp Git stash pop
command Gstcl Git stash clear
