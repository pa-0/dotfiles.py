# Git aliases
alias g='git'
alias gst='git status'

if [ "$(command -v rg)" ]
then
    alias gg='rg'
else
    alias gg='git grep -n'
fi

alias gc='git commit -v'
alias gcnv='git commit -v --no-verify'
alias gca='git commit -v --amend'
alias 'gcan!'='git commit -v --amend --no-edit'

alias gclean='git clean -fd'

alias gaa='git add --all'
alias gapa='git add --patch'

alias gb='git branch'

alias grhhh='git reset --hard HEAD'
alias grhhs='git reset --soft HEAD'

alias gu='git undo'
alias gus='git undo --soft'
alias gu1s='git undo 1 --soft'

alias gdc='gd --cached'
alias gdh='git diff HEAD^!'
# gsh is defined in fzf.zsh
alias gshd='gsh develop..HEAD'

alias gf='git fetch'
alias gl='git pull'
alias gdwn='git down'
alias gcl='git clone'

alias gco='git checkout'
alias gsw='git switch'
alias gswm='git switch main'
alias gswd='git switch develop'
alias gsw-='git switch -'
alias gswt='git switch --track'
alias gra='git restore .'
alias grsa='git restore --staged .'

alias glob="git lob"
alias glol="git lol"
alias glos="git los"
alias glast="git last"

alias gpub='git publish' # Publish is a git alias for push -u origin HEAD -f
alias genable='git enable'
alias gconf='git conf'
alias gsave='git save'
alias WIP='git wip'
alias gbrs='git branches'

alias gm='git merge'
alias gma='git merge --abort'
alias gmc='git merge --continue'

alias gp='git push'
alias gpt'git push --tags'
alias 'gpf!'='git push --force'

alias grb='git rebase'
alias grbd='git rebase develop'
alias grbi='git rebase --interactive'
alias grbid='git rebase --interactive develop'
alias grbia='git rebase --interactive --autosquash'
alias grbida='git rebase --interactive --autosquash develop'
alias grba='git rebase --abort'
alias grbc='git rebase --continue'

alias grm='git rm'
alias gmv='git mv'

alias gcpc='git cherry-pick --continue'
alias gcpa='git cherry-pick --abort'

alias gsta='git stash push'
alias gstak='git stash push --keep-index'
alias gstp='git stash pop'
alias gstas='git stash show'
alias gstcl='git stash clear'
