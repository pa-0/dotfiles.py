#!/usr/bin/sh

print_help ()
{

    echo
    echo "usage: $0 [OPTIONS]"
    echo "  By the fault the install script will override some of the config files with links"
    echo "  to the appropriate config files"
    echo
    echo "options:"
    echo "  -h: print this message"
    echo "  -t: run dnf to run dnf and install tools"
    echo "  -i: ?"
    echo "  -c: Install i3 config files"
    echo "  -n: do not run dnf update"
    echo "  -a: alias for -tic"
    echo

}
