#!/bin/sh
# assuming input is milliseconds
echo "$1 ms to date: "
date -r $(($1/1000))
