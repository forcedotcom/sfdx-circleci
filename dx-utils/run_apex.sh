#!/bin/bash
# use this command to run anonymous 
# apex in default scratch org

echo "ctrl-c to quit"

PS3='Please enter your choice: '
options=("get_username" "Quit")
select opt in `ls  -1 dx-utils/apex-scripts/| sed -e 's/\.cls$//'`
do
    case $opt in
        *) echo "you chose $opt"
            sfdx force:apex:execute -f dx-utils/apex-scripts/$opt.cls
            break
            ;;
    esac
done


