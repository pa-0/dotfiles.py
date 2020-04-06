#!/usr/bin/sh

source src/installer.sh
source src/configurer.sh


if [ $(which figlet &> /dev/null) ]; then
    figlet -n ".dotfiles"
else
    echo ".dotfiles"
fi
echo

while (( "$#" )); do
    ARG="$1"
    case $ARG in
        --help|-h)
            HELP=1
            shift
            ;;

        --install-tools)
            INSTALL_TOOLS=1
            shift
            ;;

        --install-i3|--i3)
            INSTALL_I3=1
            shift
            ;;

        --config-i3|--i3)
            CONFIG_I3=1
            shift
            ;;

        --no-updates)
            NO_UPDATES=1
            shift
            ;;

        --all)
            INSTALL_TOOLS=1
            INSTALL_I3=1
            CONFIG_I3=1
            shift
            ;;
    esac
done

print_help ()
{

    echo
    echo "usage: $0 "
    echo "  By the fault the install script will override some of the config files with links"
    echo "  to the appropriate config files"
    echo
    echo "args:"
    echo "  --help: print this message"
    echo "  --no-updates: do not run dnf update"
    echo "  --install-tools: run dnf to run dnf and install tools"
    echo "  --install-i3: run dnf and install i3"
    echo "  --config-i3: link the relevant config files"
    echo "  --i3: is an alias for --install-i3 --config-i3"
    echo

}

run_installer ()
{
    if [ $HELP ]
    then
        print_help
        exit 0
    fi

    if [ $INSTALL_TOOLS ]
    then
        install_tools
    fi

    configure_tools

    if [ $INSTALL_I3 ]
    then
        install_i3
    fi

    if [ $CONFIG_I3 ]
    then
        configure_i3
    fi

}

run_installer
