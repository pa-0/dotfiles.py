# Aliases
alias sudo='sudo ' # Use sudo with aliases
alias please='sudo'
alias prettyplease='sudo !!'
alias less='less -r'
alias untar='tar xvfz'
alias c='clear'
alias copy='pbcopy' # Meant to use it as a pipe
alias cd-='cd -'
alias e="\$EDITOR --noplugins"
alias v="\$EDITOR"
alias vim="\$EDITOR"
alias m=make

alias mv='mv -v'
alias rm='rm -i'
alias cp='cp -v'
alias mkdir='mkdir -pv'

alias -s html="\$BROWSER"

[ "$(command -v bat)" ] && alias cat='bat'
[ "$(command -v ggrep)" ] && alias grep='ggrep'
[ "$(command -v awshelp)" ] && alias aws=awshelp
[ "$(command -v nitrogen)" ] && alias wallpaper='nitrogen --restore'

if [ "$(command -v exa)" ]; then
    alias ls='exa'
    alias ll='exa --icons --long --git'
    alias lt='exa --icons --tree --git-ignore'
    alias lr='exa --icons --long --git --sort time'
else
    alias ls='ls --color=auto'
    alias ll='ls -lsF'
fi

if [ "$(command -v dnf)" ]; then
    alias dnfl='dnf list'
    alias dnfli='dnf list installed'
    alias dnfp='dnf info'
    alias dnfs='dnf search'
    alias dnfw='dnf whatprovides'
    alias dnfu='sudo dnf update'
    alias dnfy='sudo dnf update -y'
    alias dnfi='sudo dnf install'
    alias dnfyy='sudo dnf install -y'
    alias dnfr='sudo dnf remove'
fi

alias tf=terraform

alias g="git"
alias gst='git status'

if [ "$(command -v rg)" ]; then
    alias gg='rg'
else
    alias gg='git grep -n'
fi

alias gc='git commit -v'
alias gcnv='git commit -v --no-verify'
alias gca='git commit -v --amend'
alias 'gcan!'='git commit -v --amend --no-edit'

alias gclean='git clean -fd'

alias ga='git forgit add'
alias gaa='git add --all'
alias gapa='git add --patch'

alias gb='git branch'

alias grhhh='git reset --hard HEAD'
alias grhhs='git reset --soft HEAD'

alias gu='git undo'
alias gus='git undo --soft'
alias gu1s='git undo 1 --soft'

alias gd='git forgit diff'
alias gdc='gd --cached'
alias gdh='git diff HEAD^!'
alias gshd='gsh develop..HEAD'

alias gf='git fetch --prune'
alias gl='git down'
alias gcl='git clone'

alias gsw='git forgit checkout_branch'
alias gswm='git switch main'
alias gswd='git switch develop'
alias gsw-='git switch -'
alias gswt='git switch --track'

alias grs='git forgit reset_head'
alias gra='git restore .'
alias grsa='git restore --staged .'

alias glo='git forgit log'
alias glob="git lob"
alias glom="git lom"
alias glol="git lol"
alias glos="git los"
alias glast="git last"

alias gconf='git conf'
alias gsave='git save'
alias WIP='git wip'
alias gbrs='git branches'
alias gpc='gh pr create --fill'
alias gpcd='gh pr create --fill --draft'
alias gpv="gh pr view"
alias gpvw="gh pr view --web"

alias gm='git merge'
alias gma='git merge --abort'
alias gmc='git merge --continue'

alias gp='git push'
alias gpt='git push --follow-tags'
alias 'gpf!'='git push --force-with-lease'
alias gpub='git publish'

alias grb='git rebase'
alias grbd='git rebase develop'
alias grbm='git rebase main'
alias grbi='git rebase --interactive'
alias grbid='git rebase --interactive develop'
alias grbim='git rebase --interactive main'
alias grbia='git rebase --interactive --autosquash'
alias grbida='git rebase --interactive --autosquash develop'
alias grbida='git rebase --interactive --autosquash main'
alias grba='git rebase --abort'
alias grbc='git rebase --continue'
alias grbe='git rebase --edit'

alias grm='git rm'
alias gmv='git mv'

alias gcp='git forgit cherry_pick'
alias gcpc='git cherry-pick --continue'
alias gcpa='git cherry-pick --abort'

alias gsta='git stash push'
alias gstak='git stash push --keep-index'
alias gstp='git stash pop'
alias gstas='git stash show'
alias gstcl='git stash clear'

alias pd='pytest --color yes -lvxs'
alias pa='clear; pytest --color yes --durations=10 -qk ""'
alias pap='pa -n 4'
alias pdj='pap --cov --cov-report term-missing'
alias pdjc='pdj -n 4 --cov-report html'

alias mkv='virtualenv .venv && source ./.venv/bin/activate'
alias rmv='deactivate && rm -rf .venv'
alias refv='deactivate && rm -rf .venv && virtualenv .venv'
alias a='source ./.venv/bin/activate'
alias d='deactivate'

alias dps='docker ps'
alias dsa='docker stop all'
alias dcb='docker-compose build --parallel'
alias dcu='docker-compose up'
alias dcd='docker-compose down --remove-orphans'
alias dcr='docker-compose run'
