const core = require('@actions/core');
const parseChangelog = require('changelog-parser');

try {
    // `who-to-greet` input defined in action metadata file
    const pathToChangelog = core.getInput('path-to-changelog') || "./CHANGELOG.md";
    console.log(`Path to changelog ${pathToChangelog}`);
    parseChangelog(pathToChangelog)
        .then( result => {
            const maxVersion = result.versions.filter( version => version.version !== null).map( version => version.version)
                .sort( (a,b) => a.localeCompare(b))[0];
            console.log(`max version ${maxVersion}`);
            core.setOutput("max-version", maxVersion );
        } )
        .catch(error => core.setFailed(error.message))
} catch (error) {
    core.setFailed(error.message);
}