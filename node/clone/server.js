const express = require('express');
const { exec } = require('child_process');
const bodyParser = require('body-parser');
const app = express();
const port = 3000;
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
app.listen(port, () => {
    console.log(`Node.js server listening on port ${port}`);
});