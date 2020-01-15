# Git aliases
alias g='git'
alias gst='git status'

alias ggrep='git grep -n'

alias gc='git commit -v'
alias gca='git commit -v --amend'
alias 'gcan!'='git commit -v --amend --no-edit'

alias gclean='git clean -id'

alias ga='git add'
alias gaa='git add --all'
alias gapa='git add --patch'

alias grh='git reset'

alias gu='git undo'
alias gus='git undo --soft'
alias gu1s='git undo 1 --soft'

alias gd='git diff'
alias gdc='git diff --cached'
alias gdh='git diff HEAD^!'
alias gsh='git show'

alias gf='git fetch'
alias gl='git pull'
alias gcl='git clone'

alias gco='git checkout'
alias gb='git branch'
alias gbrs='git branches'

alias glol="git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset'"
alias glols="git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --stat"

alias gpub='git publish' # Publish is a git alias for push -u origin HEAD -f
alias genable='git push origin --delete $(git rev-parse --abbrev-ref HEAD) && git push'

alias gm='git merge'
alias gma='git merge abort'

alias gp='git push'
alias 'gpf!'='git push --force'

alias grb='git rebase'
alias grbid='git rebase --interactive develop'
alias grbi='git rebase --interactive'
alias grba='git rebase --abort'
alias grbc='git rebase --continue'
alias grbd='git rebase develop'

alias grm='git rm'
alias gmv='git mv'

alias gsta='git stash push'
alias gstp='git stash pop'
alias gstas='git stash show'
alias gstcl='git stash clear'
