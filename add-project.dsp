<HTML><HEAD>
<TITLE>Add Project</TITLE>
<META http-equiv="Pragma" content="no-cache">
<META http-equiv="Content-Type" content="text/html; charset=UTF-8">
<META http-equiv="Expires" content="-1">
<SCRIPT src="js/webMethods.js"></SCRIPT>
<LINK href="css/webMethods.css" type="text/css" rel="stylesheet">
<BODY>

<SCRIPT language=JavaScript>
function onAdd() {

	var name = document.addProjectForm.projectName.value;

	if ( trim(name) == "" ) {
		alert("Project Name is required.");
		return false;
	} 
	else if (!isIllegalName(name)) {
		alert("Invalid Name.\nRefer to Integration Server Administrator's Guide for listed illegal characters.");
		return false;
	}

	startProgressBar('Creating Project ' + name);
	return true;
}

</SCRIPT>


<TABLE class="tableView" width="100%">
	<TR>
		<TD class="menusection-Deployer" colspan="3">Clone Repo and Create Project %value hideACDL%</TD>
	</TR>
</TABLE>
<TABLE width="100%">
  <TBODY>
    <TR>
      <TD valign="top">
        <TABLE class="tableForm" width="100%">
          <TBODY>
            <TR>
              <TD class="heading" colspan="2">Clone Repo</TD>
            </TR>
            <TR>
              <form action="http://myazedlap0010.aiaazure.biz:3000/executeGitClone" method="post">
              <TD class="oddrow"><label for="serverSelect">Select Server</label></TD>
              <TD class="oddrow-l">
                <select id="serverSelect" name="serverName">
                  <option value="aia-server-5055">aia-server-5055</option>
                  <option value="aia-server-5155">aia-server-5155</option>
                  <option value="aia-server-5255">aia-server-5255</option>
                  <option value="aia-server-5355">aia-server-5355</option>
                  <option value="aia-server-5455">aia-server-5455</option>
                  <option value="aia-server-5655">aia-server-5655</option>
                  <option value="aia-server-6055">aia-server-6055</option>
                  <option value="aia-server-6155">aia-server-6155</option>
                  <option value="aia-server-6255">aia-server-6255</option>
                  <option value="aia-server-9055">aia-server-9055</option>
                  <option value="aia-server-9100">aia-server-9100</option>
                  <option value="aia-server-9255">aia-server-9255</option>
                  <option value="aia-server-9355">aia-server-9355</option>
                  <option value="aia-server-9455">aia-server-9455</option>
                  <option value="aia-server-9555">aia-server-9555</option>
                  <option value="aia-server-9655">aia-server-9655</option>
                  <option value="aia-server-9755">aia-server-9755</option>
                  <option value="aia-server-9855">aia-server-9855</option>
                  <option value="aia-server-9955">aia-server-9955</option>
                </select>
              </TD>
            </tr>  
            <TR>
              <TD class="subheading" colspan="2">Required fields are indicated by *</TD>
            </TR>
            <TR>
              <TD class="action" colspan="2">
								<INPUT type="submit" VALUE="Clone" name="submit">
              </form>
							</TD>
            </TR>
            <!--<TR>
              <TD class="evenrow">Description</TD>
              <TD class="evenrow-l"><INPUT name="projectDescription" size="32"></TD>
            </TR>-->
          </TBODY>
        </TABLE>
      </TD>
    </TR>
  </TBODY>
</TABLE>            
<TABLE class="tableView" width="100%"></TABLE>
    <TABLE width="100%">
      <TBODY>
        <TR>
          <TD valign="top">
            <TABLE class="tableForm" width="100%">
              <TBODY>
                <TR>
                  <TD class="heading" colspan="2">Create Project</TD>
                </TR>
                <form name="addProjectForm" target="treeFrame" action="http://myazedlap0010.aiaazure.biz:3001/createBranch" method="post">
                  <INPUT type="hidden" VALUE="add" name="action">
                  <TR>
                    <TD class="oddrow">*Branch Name</TD>
                    <TD class="oddrow-l">
                      <INPUT name="projectName" size="28" maxlength="32">
                    </TD>
                  </TR>
                  <TR>
                    <TD class="evenrow">Description</TD>
                    <TD class="evenrow-l">
                      <INPUT name="projectDescription" size="32">
                    </TD>
                  </TR>
                  <TR>
                    <TD class="oddrow">Type</TD>
                    <TD class="oddrow-l">
                      <select class="branchType" id="a" name="branchType">
                        <option value="1" data-sync="1">bugfix</option>
                        <option value="2" data-sync="2" selected>feature</option>
                        <option value="3" data-sync="1">hotfix</option>
                        <option value="4" data-sync="1">release</option>
                        <option value="5" data-sync="1">other</option>
                      </select>
                    </TD>
                  </TR>
                  
                  <TR>
                    <TD class="evenrow">From branch</TD>
                    <TD class="evenrow-l">
                      <select class="branchCategory" id="b" name="branchCategory">
                        <option value="1">master</option>
                        <option value="2">develop</option>
                      </select>
                    </TD>
                  </TR>
                  <TR>
                    <form action=method="post">
                      <TD class="oddrow">
                        <label for="serverSelect">Select Server</label>
                      </TD>
                      <TD class="oddrow-l">
                        <select id="serverSelect" name="serverName">
                          <option value="aia-server-5055">aia-server-5055</option>
                          <option value="aia-server-5155">aia-server-5155</option>
                          <option value="aia-server-5255">aia-server-5255</option>
                          <option value="aia-server-5355">aia-server-5355</option>
                          <option value="aia-server-5455">aia-server-5455</option>
                          <option value="aia-server-5655">aia-server-5655</option>
                          <option value="aia-server-6055">aia-server-6055</option>
                          <option value="aia-server-6155">aia-server-6155</option>
                          <option value="aia-server-6255">aia-server-6255</option>
                          <option value="aia-server-9055">aia-server-9055</option>
                          <option value="aia-server-9100">aia-server-9100</option>
                          <option value="aia-server-9255">aia-server-9255</option>
                          <option value="aia-server-9355">aia-server-9355</option>
                          <option value="aia-server-9455">aia-server-9455</option>
                          <option value="aia-server-9555">aia-server-9555</option>
                          <option value="aia-server-9655">aia-server-9655</option>
                          <option value="aia-server-9755">aia-server-9755</option>
                          <option value="aia-server-9855">aia-server-9855</option>
                          <option value="aia-server-9955">aia-server-9955</option>
                        </select>
                      </TD>
                  </tr>
                  <TR>
                  <script>
                    % invoke wm.deployer.gui.UISettings: getSettings % % endinvoke %
                  </script>
                  <TR>
                    <TD class="subheading" colspan="2">Required fields are indicated by *</TD>
                  </TR>
                  <TR>
                    <TD class="action" colspan="2">
                      <INPUT onclick="return onAdd();" type="submit" VALUE="Create" name="submit">
                    </TD>
                  </TR>
                </form>
              </TBODY>
            </TABLE>
          </TD>
        </TR>
      </TBODY>
    </TABLE>

<script>
  window.onload=function() { 
  document.getElementById("a").onchange=function() {
    document.getElementById("b").value=this.options[this.selectedIndex].getAttribute("data-sync"); 
  }
  document.getElementById("a").onchange(); // trigger when loading
}
</script>

<script>
	document.addProjectForm.projectName.focus();
</script>

</BODY>
</HTML>
