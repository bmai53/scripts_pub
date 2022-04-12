#!/bin/sh
set -e

currentBranch=$(git branch --show-current)
git push -u origin $currentBranch