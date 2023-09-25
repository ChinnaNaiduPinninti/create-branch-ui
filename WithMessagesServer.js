const express = require('express');
var http = require('http');
const {
	exec
} = require('child_process');
const bodyParser = require('body-parser');
const app = express();
const port = 3001;
const regex = /^\S+$/; //regex for null or empty or white space

app.use(bodyParser.urlencoded({
	extended: true
}));
app.use(express.static(__dirname + '/public'));

app.post('/createBranch', (req, res) => {
	const branchName = req.body.projectName;
	const branchCategory = req.body.branchCategory;
	const branchType = req.body.branchType;
	const serverName = req.body.serverName;

	const {exec} = require('child_process');
	console.log(`${branchType}`);
	console.log(`${branchCategory}`);
	console.log(`${serverName}`);
	console.log(`${branchName}`);
	if (regex.test(branchName)) {
		if (branchCategory == 'develop')
        {
             if(branchType == 'bugfix/' || branchType == 'hotfix/' || branchType == 'release/' || branchType == 'other'|| branchType == 'feature/')
             var script = exec(`C:/Users/vkraft/AppData/Local/Programs/Git/git-bash.exe C:/Users/vkraft/pubsubusingkafkaandwebmrepo/git-createBranchDevelop-script.sh "${branchName},${serverName},${branchType}",${branchCategory}`,
				(error, stdout, stderr) => {
					console.log(stdout);
					console.log(stderr);
					if (error !== null) {
						console.log(`exec error: ${error}`);
                    }
                    else {
						res.send(`Branch Created Successfully In Develop`);
					}
				});       
			}
           else if (branchCategory == 'master')
        {
             if(branchType == 'bugfix/' || branchType == 'hotfix/' || branchType == 'release/' || branchType == 'other'){
             var script = exec(`C:/Users/vkraft/AppData/Local/Programs/Git/git-bash.exe C:/Users/vkraft/pubsubusingkafkaandwebmrepo/git-createBranchDevelop-script.sh "${branchName},${serverName},${branchType}",${branchCategory}`,
				(error, stdout, stderr) => {
					console.log(stdout);
					console.log(stderr);
					if (error !== null) {
						console.log(`exec error: ${error}`);
                    }
                    else {
						res.send(`Branch Created Successfully In Master`);
					}
				});
            }
            else{
                res.send(`Branch Not Created`);       
			}
        }
            else{
                res.send(`Branch Not Created`);
            }
                
            }else{
                res.send(`Branch Not Created`);
            }
});

app.listen(port, () => {
	console.log(`Node.js server listening on port ${port}`);
});
