#!/bin/bash
# use this command when creating a new branch 
# from current checked-out branch

if [ $# -lt 1 ]
then
    echo Usage: deploy.sh alias
    exit
fi

#deploy legacy metadata
sfdx force:mdapi:deploy --checkonly -w -1 --deploydir deploy -u $1 --testlevel RunSpecifiedTests --runtests RandomDogController_Test,DataTest,DescribeCacheTest,FindTest,LimitsSnapshotTest,QueryTest,SecUtilTest,UserTest

sleep 5s

sfdx force:mdapi:deploy:report