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

while getopts "hticna" ARG
do
    case $ARG in
        h )
            print_help
            exit 1
            ;;
        t ) INSTALL_TOOLS=1;;
        i ) INSTALL_I3=1
            CONFIG_I3=1;;
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
    configure_tools
    [ "$CONFIG_I3" ] && configure_i3
    [ "$INSTALL_TOOLS" ] && install_tools
    [ "$INSTALL_I3" ] && install_i3
}

run_installer
