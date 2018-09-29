#!/bin/bash
# use this command to clean up after a 
# feature branch is merged (or rejected)

if [ $# -lt 1 ]
then
    echo Usage: setup_scratch_org.sh alias
    exit
fi

#create a scratch org for this branch
sfdx force:org:create -s -f config/project-scratch-def.json -a $1;

#install dependency package(s)
#Skuid
sfdx force:package:install --wait 6 --noprompt --package 04t4A000000YWsbQAG

## push local code artifacts to scratch org
sfdx force:source:push;

## assign any required permission sets
# sfdx force:user:permset:assign -n Random_Dog

#set the default scratch org name
sfdx force:config:set defaultusername=$1

#run anonymous apex scripts 
sfdx force:apex:execute -f dx-utils/apex-scripts/get_username.cls -u $1

#generate a password for default user
sfdx force:user:password:generate

sfdx force:org:display --verbose  --json > scratch_org_info.json

sfdx force:user:display --json > scratch_user_info.json

sfdx force:org:open --json -r > scratch_auth_info.json


if [ $# -eq 1 ]
then
    # open new scratch org in browser to default page
    sfdx force:org:open
fi
 
