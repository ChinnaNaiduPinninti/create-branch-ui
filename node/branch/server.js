const express = require('express');
var http=require('http');
const { exec } = require('child_process');
const bodyParser = require('body-parser');
const app = express();
const port = 3001;
app.use(bodyParser.urlencoded({ extended: true }));
app.use(express.static(__dirname + '/public'));

app.post('/createBranch', (req, res) => {
             const branchName = req.body.projectName;
             const branchCategory = req.body.branchCategory;
             const branchType = req.body.branchType;
             const serverName=req.body.serverName;
             const { exec } = require('child_process');
             console.log(`${branchType}`);
             console.log(`${branchCategory}`);
             console.log(`${serverName}`);

             //---------for creating feature branch in develop-----
             if (branchName !=null && branchCategory=='2' && branchType=='2' ){
             var script = exec(`bash /opt/wm/git/git-createBranchDevelop-script.sh "${branchName},${serverName}"`,
                     (error, stdout, stderr) => {
                         console.log(stdout);
                         console.log(stderr);
                         if (error !== null) {
                             console.log(`exec error: ${error}`);
                         }
                         else{
                            res.send(`Branch Created Successfully in develop`);
                         }
                     });}
                      //---------for creating feature branch in master-----
             else if (branchName !=null && branchCategory=='1') {
                        if(branchType=='1'||branchType=='3'||branchType=='4'||branchType=='5')
                        {
                                    var script = exec(`bash /opt/wm/git/git-createBranchMaster-script.sh "${branchName},${serverName}"`,
                                        (error, stdout, stderr) => {
                                        console.log(stdout);
                                        console.log(stderr);
                                            if (error !== null) {
                                                console.log(`exec error: ${error}`);
                                            }
                                            else{
                                                res.send(`Branch Created Successfully in master`);
                                            }
                                        });
                                }else {
                                        res.send(`Branch Not Created `);
                                     } 
                        }
                     else {
                        res.send(`Branch Not Created `);//default responses
                     }
                    
});
app.listen(port, () => {
    console.log(`Node.js server listening on port ${port}`);
});