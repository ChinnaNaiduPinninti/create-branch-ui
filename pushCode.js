const express = require('express');
const fs = require('fs');
var http = require('http');
const {
	exec
} = require('child_process');
const bodyParser = require('body-parser');

const app = express();
const port = 3005;

app.use(bodyParser.urlencoded({
	extended: true
}));
app.use(express.static(__dirname + '/public'));
app.use(bodyParser.json());
app.post('/pushCode', (req) => {
  
  const requestBody = req.body;
  console.log(requestBody);
  var branchName = req.body.branchName;
  const branchType=req.body.branchType;
  const message = req.body.message;
  console.log(branchType);
  branchName=branchType+branchName;

 var script = exec(`C:/Users/vkraft/AppData/Local/Programs/Git/git-bash.exe C:/Users/vkraft/Desktop/devOps/git/create-branch-ui/aia-server-5255/push.sh "${branchName},${message}"`,
  (error, stdout, stderr) => {
    console.log(stdout);
    console.log(stderr);
    if (error !== null) {
      console.log(`exec error: ${error}`);
              }
              else {
                  console.log(branchName);
                  console.log(message);
                 
                  }
  });
});

app.listen(port, () => {
	console.log(`Node.js server listening on port ${port}`);
});
