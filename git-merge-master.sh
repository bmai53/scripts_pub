#!/bin/sh
set -e

currentBranch=$(git branch --show-current)
git checkout master
git pull
git checkout $currentBranch
git merge master