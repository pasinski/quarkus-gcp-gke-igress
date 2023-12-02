const core = require('@actions/core');
const parseChangelog = require('changelog-parser');
const _ = require("underscore");


try {
    // `who-to-greet` input defined in action metadata file
    const pathToChangelog = core.getInput('path-to-changelog') || "./CHANGELOG.md";
    console.log(`Path to changelog ${pathToChangelog}`);
    parseChangelog(pathToChangelog)
        .then( result => {
            const versions = result.versions;
            const maxVersion = _.max( versions.filter( version => version.version !== null).map( version => version.version) );
            console.log(`Versions ${versions}`);
            core.setOutput("max-version", maxVersion );
        } )
        .catch(error => core.setFailed(error.message))
} catch (error) {
    core.setFailed(error.message);
}