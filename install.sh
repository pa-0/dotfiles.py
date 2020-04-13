#!/usr/bin/sh

. src/installer.sh
. src/configurer.sh
. src/helper.sh

if [ "$(command -v figlet)" ]
then
    figlet -n ".dotfiles"
else
    echo ".dotfiles"
fi
echo

if [ "$(command -v dnf)" ]
then
    HAS_DNF=1
else
    HAS_DNF=0
fi
export HAS_DNF

while getopts "hticna" ARG
do
    case $ARG in
        h )
            print_help
            exit 1
            ;;
        t ) INSTALL_TOOLS=1;;
        i ) INSTALL_I3=1;;
        c ) CONFIG_I3=1;;
        n ) NO_UPDATES=1;;
        a ) INSTALL_TOOLS=1
            INSTALL_I3=1
            CONFIG_I3=1
            ;;
        \? )
            echo "Unrecognized option."
            print_help
            exit 1
            ;;
    esac
done

run_installer ()
{
    if [ "$INSTALL_TOOLS" ]
    then
        install_tools
    fi

    configure_tools

    if [ "$INSTALL_I3" ] && [ "$HAS_DNF" ]
    then
        install_i3
    fi

    if [ "$CONFIG_I3" ]
    then
        configure_i3
    fi

}

run_installer
