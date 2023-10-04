const express = require('express');
const { exec } = require('child_process');
const bodyParser = require('body-parser');
const app = express();
const port = 3000;
const regex = /^\S+$/; //regex for null or empty or white space
app.use(bodyParser.urlencoded({ extended: true }));
app.use(express.static(__dirname + '/public'));
app.post('/executeGitClone', (req, res) => {
    const serverName = req.body.serverName;
    const repositoryName = req.body.repositoryName;
    // Construct the Git clone command
    const gitCloneCommand = `git clone https://vishnusangaraju@bitbucket.org/myaia/${serverName}.git`;
    exec(`bash /opt/wm/git/git-clone-script.sh "${gitCloneCommand}"`, (error, stdout, stderr) => {
        if (error) {
            console.error(`Error executing git clone: ${error.message}`);
            res.status(500).send(`Error executing git clone: ${error.message}`);
        } else {
            console.log(`Git clone command output: Success`);
            res.send(`Cloned Successfully`);
        }
    });
});
app.post('/createBranch', (req, res) => {
    const branchName = req.body.projectName;
    const branchCategory = req.body.branchCategory;
    const branchType = req.body.branchType;
    const serverName = req.body.serverName;
    console.log(`${branchType}`);
    console.log(`${branchCategory}`);
    console.log(`${serverName}`);
    console.log(`${branchName}`);
    
    if (regex.test(branchName)) {
        if (branchCategory == 'develop') {
            if (branchType == 'bugfix/' || branchType == 'hotfix/' || branchType == 'release/' || branchType == 'other' || branchType == 'feature/') {
                var script = exec(`bash /opt/wm/git/git-createBranch-script.sh "${branchName},${serverName},${branchType},${branchCategory}"`,
                    (error, stdout, stderr) => {
                        console.log(stdout);
                        console.log(stderr);
                        if (error !== null) {
                            console.log(`exec error: ${error}`);
                        } else {
                            res.send(`Branch Created Successfully In Develop`);
                        }
                    });
            }
        } else if (branchCategory == 'master') {
            if (branchType == 'bugfix/' || branchType == 'hotfix/' || branchType == 'release/' || branchType == 'other') {
                var script = exec(`bash /opt/wm/git/git-createBranch-script.sh "${branchName},${serverName},${branchType},${branchCategory}"`,
                    (error, stdout, stderr) => {
                        console.log(stdout);
                        console.log(stderr);
                        if (error !== null) {
                            console.log(`exec error: ${error}`);
                        } else {
                            res.send(`Branch Created Successfully In Master`);
                        }
                    });
            } else {
                res.send(`Branch Not Created`);
            }
        } else {
            res.send(`Branch Not Created`);
        }
    } else {
        res.send(`Branch Not Created`);
    }
});
app.listen(port, () => {
    console.log(`Node.js server listening on port ${port}`);
});