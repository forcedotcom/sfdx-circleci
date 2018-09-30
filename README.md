# sfdx-circleci 
[![CircleCI](https://circleci.com/gh/HealthDetail/sfdx-circleci.svg?style=svg)](https://circleci.com/gh/HealthDetail/sfdx-circleci)

Note: CircleCI is already configured with an ENV Variable: `DEV_HUB_AUTH_URL` which was obtained by logging into Dev Hub (see below), and running `sfdx force:org:display -u healthDetailHub --verbose` to obtain the `Sfdx Auth Url` for authentication.  This replaces the previous connected app with server key process and requires no further configuration.

## first steps
- You must have DevHub permissions in the HealthDetail production org
- You must have R/W Github permissions on `HealthDetail/sfdx-circleci`

## Dev, Build and Test

- connect to DevHub org (and make it your default hub with an alias):
`sfdx force:auth:web:login --setdefaultdevhubusername --setalias healthDetailHub`

- create branch and scratch org (and make it your default): 
`./dx-utils/create_branch.sh branch_name`

- delete branch (local and remote) and delete scratch org
`./dx-utils/delete_branch.sh branch_name`

- run the tests:
`sfdx force:apex:test:run --resultformat tap --codecoverage -d test_results`