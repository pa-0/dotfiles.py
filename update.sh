#!/bin/zsh

if [[ -v ZSH_CUSTOM ]]; then
    for CUSTOMDIR in $(ls -d $ZSH_CUSTOM/themes/* $ZSH_CUSTOM/plugins/*); do
        if [[ $(basename $CUSTOMDIR) =~ 'example.*' ]]; then
            # IGnore example files in oh my zsh custom folder
            continue
        fi
        echo -n "Updating $(basename $CUSTOMDIR)..."
        cd $CUSTOMDIR
        git pull --rebase origin master --quiet
        cd -
        echo " done!"
    done
fi
