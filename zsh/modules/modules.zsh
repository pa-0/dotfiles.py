# Export Modulepath variable
HOME_MODULEPATH="$DOTFILES/Modules/modulefiles"
[[ -d $HOME_MODULEPATH && ! $MODULEPATH =~ $HOME_MODULEPATH ]] &&
    export MODULEPATH="$MODULEPATH:$HOME_MODULEPATH"

[ "$(command -v module)" ] && module load git/latest python/latest
