#!/bin/bash
#use this command when deleting a branch and it's associated scratch org

if [ $# -lt 1 ]
then
    echo Usage: delete_branch.sh branchname
    exit
fi

#this should be changed to integration branch
git checkout master

#delete the local branch
git branch -D $1;

#delete the scratch org with no prompt
sfdx force:org:delete -p -u $1;

#delete the remote branch
git push origin --delete $1;

#unset default scratch org (since we just deleted it)
sfdx force:config:set defaultusername=master

#info display all dx orgs
sfdx force:org:list

#display current branch name
git branch

#pull latest from remote origin
git pull

#cleanup old info files
rm scratch_org_info.json
rm scratch_user_info.json
rm scratch_auth_info.json