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
    echo "  -t: Run dnf to install tools"
    echo "  -c: Install i3 config files"
    echo "  -i: Run dnf to install i3 tools (implies -c)"
    echo "  -f: Configure Qtile"
    echo "  -q: Install Qtile"
    echo "  -n: do not run dnf update"
    echo "  -a: alias for -tc"
    echo

}
