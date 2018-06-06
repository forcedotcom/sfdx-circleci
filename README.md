# sfdx-circleci 
[![CircleCI](https://circleci.com/gh/HealthDetail/sfdx-circleci.svg?style=svg)](https://circleci.com/gh/HealthDetail/sfdx-circleci)

## first steps
- You must have DevHub permissions in the HealthDetail production org
- You must have R/W Github permissions on `HealthDetail/sfdx-circleci`

## Dev, Build and Test

- connect to DevHub org (and make it your default hub with an alias):
`sfdx force:auth:web:login --setdefaultdevhubusername --setalias healthDetailHub`

- create scratch org (and make it your default): 
`sfdx force:org:create --setdefaultusername -f config/project-scratch-def.json --setalias <alias>`

- push the metadata to scratch org:
`sfdx force:source:push;`

- open the app:
`sfdx force:org:open`

- run the tests:
`sfdx force:apex:test:run --resultformat tap --codecoverage -d test_results`