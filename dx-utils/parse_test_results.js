#!/usr/local/bin/node

/* eslint-env es6 */

var fs = require('fs'),
    testRunId,
    coverage;

if (process.argv.length === 2) {
    //get the latest run test id
    testRunId = fs.readFileSync('test_results/test-run-id.txt', 'utf8');
    //parse the latest code coverage file
    coverage = JSON.parse(fs.readFileSync('test_results/test-result-codecoverage.json', 'utf8'));

} else {
    //use user-provided test run id
    console.log(process.argv[2]);
    testRunId = process.argv[2];
}


var testRunFilename = `test_results/test-result-${testRunId}.json`,
    //parse the latest results file 
    results = JSON.parse(fs.readFileSync(testRunFilename, 'utf8'))


console.log(`test run id ${testRunId}`);

if (results.summary.outcome === 'Failed') {
    //report all summary info
    console.log(results.summary);
    //show info for each failing test
    for (var test of results.tests) {
        if (test.Outcome === 'Fail') {
            console.log(`\nFAILURE: ${test.StackTrace} \n ${test.Message}\n`);
        }
    }

} else {
    //everything is ok
    if (coverage.length) {
        console.log(`All tests pass\nCode Coverage: ${coverage[0].coveredPercent}%\n`);
    } else {
        console.log(`there is no code coverage from this run`);
    }
}