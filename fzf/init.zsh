# Settings and functions for FZF

# Setting fd as the default source for fzf
export FZF_DEFAULT_COMMAND='fd'

# Default options for all fzf calls
export FZF_DEFAULT_OPTS="--ansi --reverse --border --height 80% --exact --exit-0 --select-1 --preview-window=right:75%"

# To apply the command to CTRL-T as well
export FZF_CTRL_T_COMMAND="$FZF_DEFAULT_COMMAND"

FZF_MODULES="$DOTFILES/fzf/modules"

for module ($FZF_MODULES/*.zsh) source $module
