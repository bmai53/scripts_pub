#!/bin/sh
set -e

show_help() {
    cat << EOF
Usage:
    -r  recursive from dev desktop
    -l  local to dev desktop
    -h  show this help message
EOF
}

if [ "$1" = "-h" ]; then 
    show_help

elif [ "$1" = "-r" ]; then
    echo "Transferring recursively from devdesktop"
    shift
    scp -r "$user@$cloudDesk:$@" .

elif [ "$1" = "-l" ]; then
    echo "Transferring local file to devdesktop"
    shift
    scp "$@" "$user@$cloudDesk:/home/$user"

else
    echo "Transferring from devdesktop"
    scp "$user@$cloudDesk:$@" .
fi
