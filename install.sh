#!/usr/bin/sh

# TODO: Make it so installer knows where it is, i.e.: Relative referencing of files.
. .setup/installer.sh
. .setup/configurer.sh
. .setup/helper.sh

cat .setup/banner.txt

while getopts "htica" ARG
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
