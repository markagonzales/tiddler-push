#!/bin/bash

TODAY="$(date +'%d/%m/%Y')"

echo "Running $TODAY"

SSHAGENTRUNNING=$(pgrep ssh-agent);

if [[ ! $SSHAGENTRUNNING -gt 0 ]];
then
    echo "SSH agent process isn't running. Exit now....";
    # we should try to start the process? not a big deal but it would be nice...
    exit 1;
fi

cd /Users/mag7234/Documents/Wiki/nodewiki/tiddlers

NEEDSCOMMIT=$(git status -s);

# if this output is non-zero length, then we need to perform a commit and push
if [[ ! -z $NEEDSCOMMIT ]]
then
   echo "$today: Needs a commit";
   git pull origin master;
   git add -A .;
   git commit -m "Automated commit. Changes added. Commit and push...";
   git push origin master;
else
   echo "Nothing to commit on $TODAY. See you tomorrow.";
fi
