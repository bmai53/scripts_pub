#!/bin/sh
set -e

if [ "$#" -lt 1 ]; then
  echo "Error: no commit message"
  exit 1
fi

git commit -m "$*"