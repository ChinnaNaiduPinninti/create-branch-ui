const fs = require('fs').promises;
const express = require('express');
const bodyParser = require('body-parser');
const app = express();
const port = 3007;
const regex = /^\S+$/; // regex for null or empty or white space
const cors = require('cors');
const path = require('path');
const git = require('simple-git');
const exec = require('sync-exec');
app.use(cors());

const corsOptions = {
  origin: 'http://myazedlap0010.aiaazure.biz:3000', // Replace with your frontend's URL
  methods: 'POST',
  allowedHeaders: 'Content-Type',
};

// Handle pre-flight requests for all routes
app.options('*', cors(corsOptions));

app.use(bodyParser.urlencoded({ extended: true }));
app.use(express.static(__dirname + '/public'));
app.use(bodyParser.json());

app.post('/createBranch', (req, res) => {
  const branchName = req.body.projectName;
  const branchCategory = req.body.branchCategory;
  const branchType = req.body.branchType;
  const serverName = req.body.serverName;

  console.log(`branchType: ${branchType}`);
  console.log(`branchCategory: ${branchCategory}`);
  console.log(`serverName: ${serverName}`);
  console.log(`branchName: ${branchName}`);

  const gitDirectory = `${serverName}_${branchName}`;
  console.log(`gitDirectory: ${gitDirectory}`);

  if (regex.test(branchName)) {
    if (branchCategory === 'develop' || branchCategory === 'master') {
      if (
        branchType === 'bugfix/' ||
        branchType === 'hotfix/' ||
        branchType === 'release/' ||
        branchType === 'other' ||
        branchType === 'feature/'
      ) {
        const gitDirectoryPath = path.join('/opt', 'wm', 'git', gitDirectory, serverName);

        try {
          // Change to the Git directory
          process.chdir(gitDirectoryPath);

          // Switch to the specified branch category
          exec(`git switch ${branchCategory}`, { stdio: 'inherit' });

          if (branchType === 'other') {
            // Create and switch to a new branch
            exec(`git branch ${branchName}`, { stdio: 'inherit' });
            exec(`git switch ${branchName}`, { stdio: 'inherit' });
          } else {
            // Create and switch to a new branch with branchType prefix
            const newBranchName = `${branchType}${branchName}`;
            exec(`git branch ${newBranchName}`, { stdio: 'inherit' });
            exec(`git switch ${newBranchName}`, { stdio: 'inherit' });
          }

          res.status(201).send('Branch Created Successfully');
        } catch (error) {
          console.error('Error:', error.message);
          res.status(400).send('Branch Not Created');
        }
      } else {
        res.status(400).send('Invalid branchType');
      }
    } else {
      res.status(400).send('Invalid branchCategory');
    }
  } else {
    res.status(400).send('Invalid branchName');
  }
});

app.post('/executeGitClone', (req, res) => {
  const serverName = req.body.serverName;
  const branchName = req.body.projectName;
  const repoUrl = `https://vishnusangaraju@bitbucket.org/myaia/${serverName}.git`;
  const gitDirectory = `${serverName}_${branchName}/${serverName}`;
  const targetDirectory = path.join('/opt/wm/git', gitDirectory);

  console.log(`serverName: ${serverName}`);
  console.log(`branchName: ${branchName}`);
  console.log(`repoUrl: ${repoUrl}`);
  console.log(`targetDirectory: ${targetDirectory}`);

  async function createDirectoryIfNotExists(directoryPath) {
    try {
      await fs.mkdir(directoryPath, { recursive: true });
      console.log('Directory created successfully:', directoryPath);
    } catch (error) {
      if (error.code !== 'EEXIST') {
        console.error('Error creating directory:', error);
        res.status(400).send('Branch Not Created');
      }
    }
  }

  async function cloneRepository(repoUrl, targetDirectory) {
    await createDirectoryIfNotExists(targetDirectory);

    try {
      await git()
        .silent(true)
        .clone(repoUrl, targetDirectory);
      console.log('Repository cloned successfully.');
      res.status(201).send('Branch Created Successfully');
    } catch (error) {
      console.error('Error cloning repository:', error);
      res.status(400).send('Branch Not Created');
    }
  }

  const dir = '/opt/wm/node/projectNames/';
  const filename = `${branchName}.txt`;
  const data = `${serverName}`;

  async function saveToFile() {
    try {
      await fs.writeFile(path.join(dir, filename), data);
      console.log('Data has been written to the file in the specified directory');
    } catch (err) {
      console.error('Error writing to the file:', err);
    }
  }

  saveToFile();
  cloneRepository(repoUrl, targetDirectory);
});

app.listen(port, () => {
  console.log(`Node.js server listening on port ${port}`);
});
