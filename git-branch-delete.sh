#!/bin/sh
set -e

# or ---> sed 's/ //g'
COUNT=$(git branch | wc -l | tr -d ' ')
echo "\nCurrent Local Branches ($COUNT):\n"
for branch in "$(git branch)";
do
    echo "$branch"
done
echo "\n"

read -p "Delete branches? (y/n): " confirm

DELETED=0
if [ -z "$confirm" ]; then
    echo "No response given. Quitting..."
elif [ "$confirm" = "y" ] || [ "$confirm" = "Y" ]; then
    CURRENT_BRANCH=$(git branch --show-current)
    if [ $CURRENT_BRANCH != "master" ]; then
        echo "Can only delete on master branch. Quiting..."
    else
         echo "Deleting branches..."
        git branch | grep -v "master" | xargs git branch -D
        DELETED=$COUNT
        let "DELETED--" # won't delete master branch
    fi
elif [ "$confirm" = "n" ] || [ "$confirm" = "N" ]; then
    echo "Aborting..."
else
    echo "Response not recognized. Quitting..."
fi

echo "Done. Number of deleted branches: $DELETED"