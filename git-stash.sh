#!/bin/sh
set -e

usage()
{
cat << EOF
usage: $0 [-h] [-l] [-p] [-a index] [-d index] [comments]

This scripts make stashing faster

OPTIONS:
  -h help
  -l list                  list stash
  -p pop                   git stash pop
  -a apply <stash_index>   apply stash @index (git stash apply stash@{INDEX})
  -d drop <stash_index>    drop stash @ index  (git stash drop INDEX)
EOF
}

die() { echo "$*" >&2; exit 2; }  # complain to STDERR and exit with error
needs_arg() { if [ -z "$OPTARG" ]; then die "No arg for --$OPT option"; fi; }


while getopts :hla:pd:-: OPT; do
  # support long options: https://stackoverflow.com/a/28466267/519360
  if [ "$OPT" = "-" ]; then   # long option: reformulate OPT and OPTARG
    OPT="${OPTARG%%=*}"       # extract long option name
    OPTARG="${OPTARG#$OPT}"   # extract long option argument (may be empty)
    OPTARG="${OPTARG#=}"      # if long option argument, remove assigning `=`
  fi
  case "$OPT" in
    h | help )     usage; exit 1 ;;
    l | list )     git stash list; exit 0;;
    a | apply )    git stash apply stash@{"$OPTARG"}; exit 0;;
    p | pop )      git stash pop; exit 0 ;;
    d | drop )     git stash drop "$OPTARG"; exit 0 ;;
    ??* )          usage; die "\nIllegal option --$OPT" ;;  # bad long option
    ? )            usage; exit 2 ;;
  esac
done
shift $((OPTIND-1)) # remove parsed options and args from $@ list
# remaining_args="$@"

if [ "$#" -lt 1 ]; then
  git stash
  exit 0
fi

git stash -m "$*"