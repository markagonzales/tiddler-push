#!/bin/bash

SSHAGENTRUNNING=$(pgrep ssh-agent);

if [ ! $SSHAGENTRUNNING -gt 0 ]
then
    echo "SSH agent process isn't running. Exit now....";
    # we should try to start the process? not a big deal but it would be nice...
    exit 1;
fi

NEEDSCOMMIT=$(git status -s);
TODAY="$(date +'%d/%m/%Y')"

# if this output is non-zero length, then we need to perform a commit and push
if [[ ! -z $NEEDSCOMMIT ]]
then
   echo "$today: Needs a commit";
   git pull origin master;
   git add -A .;
   git commit -m "Automated commit. Changes added. Commit and push...";
   git push origin master;
else
   echo "Nothing to commit on $(date +'%m-%d-%y'). See you tomorrow.";
fi
