# Load texlive
TEXLIVE_INSTALL=/usr/local/texlive/2021/
if [[ -d $TEXLIVE_INSTALL ]]; then
    TEXLIVE_BIN="$TEXLIVE_INSTALL/bin/x86_64-linux"
    [[ -d $TEXLIVE_BIN ]] && path+="$TEXLIVE_BIN"

    TEXLIVE_MAN="$TEXLIVE_INSTALL/texmf-dist/doc/man"
    [[ -d $TEXLIVE_MAN ]] && export MANPATH="$MANPATH:$TEXLIVE_MAN"

    TEXLIVE_INFO="$TEXLIVE_INSTALL/texmf-dist/doc/info"
    [[ -d $TEXLIVE_INFO ]] && export INFOPATH="$INFOPATH:$TEXLIVE_INFO"
fi
