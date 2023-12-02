const core = require('@actions/core');
const parseChangelog = require('changelog-parser');
const _ = require("underscore");


try {
    // `who-to-greet` input defined in action metadata file
    const pathToChangelog = core.getInput('path-to-changelog') || "./CHANGELOG.md";
    console.log(`Path to changelog ${pathToChangelog}`);
    parseChangelog(pathToChangelog)
        .then( result => core.setOutput("max-version", _.max( result.versions.filter( version => version.version !== null).map( version => version.version) ) ) )
        .catch(error => core.setFailed(error.message))
} catch (error) {
    core.setFailed(error.message);
}