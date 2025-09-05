#!/bin/sh
set -e

if [ "$1" == "-h" ]; then
    echo
    "
    -r recursive from dev desktop
    -l local to dev desktop
    "
  elif [ "$1" == "-r" ]; then
    echo "transferring recursively from devdesktop"
    shift
    scp -r vbennmai@$cloudDesk:"$@" .
  elif [ "$1" == "-l" ]; then
    echo "transferring local file to devdesktop"
    shift
    scp "$@" vbennmai@$cloudDesk:"/home/vbennmai"
  else
    echo "transferring from devdesktop"
    scp vbennmai@$cloudDesk:"$@" .
  fi
