#!/bin/bash
# use this command to switch your 
# branch and org and open the org

if [ $# -lt 1 ]
then
    echo Usage: switch_branch.sh branchname
    exit
fi

#checkout a branch
git checkout $1

#set the default scratch org name
sfdx force:config:set defaultusername=$1

#open the org
sfdx force:org:open