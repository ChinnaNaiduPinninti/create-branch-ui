const express = require('express');
var http = require('http');
const {
	exec
} = require('child_process');
const bodyParser = require('body-parser');
const app = express();
const port = 3000;
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
		if (branchCategory == '2'&& branchType=='2') {
             var script = exec(`C:/Users/vkraft/AppData/Local/Programs/Git/git-bash.exe C:/Users/vkraft/pubsubusingkafkaandwebmrepo/git-createBranchDevelop-script.sh "${branchName},${serverName}"`,
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

        else if (branchCategory==2){
                if(branchType == '1' || branchType == '3' || branchType == '4' || branchType == '5')
                {res.send(`Can Not Create BugFix/Hotfix/Release/Other Branches In Develop`);}
                
            }
		//---------for creating feature branch in master-----
		else if (branchCategory == '1' && branchType != '2') {
				        var script = exec(`C:/Users/vkraft/AppData/Local/Programs/Git/git-bash.exe C:/Users/vkraft/pubsubusingkafkaandwebmrepo/git-createBranchMaster-script.sh "${branchName}"`,
					        (error, stdout, stderr) => {
                                console.log(stdout);
                                console.log(stderr);
                                if (error !== null) {
                                    console.log(`exec error: ${error}`);

                                } else {
                                    res.send(`Branch Created Successfully In Master`);
                                }
					});
			} 
            else if (branchCategory==1 && branchType=='2'){
                {res.send(`Can Not Create Feature Branch In Master`);}
                
            } 
		}
        else{
        res.send(`Branch Name Can Not Be Null Or Empty Or WhiteSpace`);
        }

});

app.listen(port, () => {
	console.log(`Node.js server listening on port ${port}`);
});