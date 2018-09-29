#!/bin/bash
# use this command to run all package unit tests
# 

#if no arguments, then run in default scratch org
if [ $# -lt 1 ]
then
    echo Running tests in default scratch org
    sfdx force:apex:test:run -l RunLocalTests -r human --wait 60 --verbose
    exit
fi

#otherwise run tests in specified username or alias org
sfdx force:apex:test:run -l RunLocalTests -r human --wait 60 --verbose -u $1

./dx-utils/puppet.sh
echo "puppet"