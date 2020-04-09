# Using Modules environement
if $(which module &> /dev/null); then
    module load git/2.25.0
fi

# Git aliases
alias g='git'
alias gst='git status'

alias ggrep='git grep -n'

alias gc='git commit -v'
alias gca='git commit -v --amend'
alias 'gcan!'='git commit -v --amend --no-edit'

alias gaa='git add --all'
alias gapa='git add --patch'

alias grhhh='git reset --hard HEAD'
alias grhhs='git reset --soft HEAD'

alias gu='git undo'
alias gus='git undo --soft'
alias gu1s='git undo 1 --soft'

alias gdc='git diff --cached'
alias gdh='git diff HEAD^!'
alias gsh='git show'

alias gf='git fetch'
alias gl='git pull'
alias gcl='git clone'

alias gco='git checkout'
alias gsw='git switch'
alias gswd='git switch develop'
alias gsw-='git switch -'
alias gr='git restore'
alias gra='git restore .'
alias grs='git restore --staged'
alias grsa='git restore --staged .'
alias gb='git branch'

alias glol="git lol"
alias glos="git los"
alias glas="git last"

alias gpub='git publish' # Publish is a git alias for push -u origin HEAD -f
alias genable='git enable'
alias gconf='git conf'
alias gup='git down'
alias gsave='git save'
alias WIP='git wip'
alias gbrs='git branches'

alias gm='git merge'
alias gma='git merge --abort'
alias gmc='git merge --continue'

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

alias gcp='git cherry-pick'

alias gsta='git stash push'
alias gstp='git stash pop'
alias gstas='git stash show'
alias gstcl='git stash clear'
