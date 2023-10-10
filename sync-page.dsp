<HTML><HEAD>
    <META http-equiv="Pragma" content="no-cache">
    <META http-equiv="Content-Type" content="text/html; charset=UTF-8">
    <META http-equiv="Expires" content="-1">
    <LINK href="css/webMethods.css" type="text/css" rel="stylesheet">
    <SCRIPT src="js/webMethods.js"></SCRIPT>
    </HEAD>
    <BODY>
    
    <SCRIPT language=JavaScript>
    </SCRIPT>
    
    <TABLE width="100%">
        <TR>
            <TD class="menusection-DeployerTools" colspan="4"> Sync to branch
            </TD>
        </TR>
    </TABLE>
    <!- Determine if this user is empowered to project creation/copy stuff ->
      %invoke wm.deployer.UIAuthorization:isAuthorized%
      %endinvoke%
    <TABLE width="100%">  
      %ifvar action equals('exportToProjectAutomator')%
          %invoke wm.deployer.Util:exportProjectToProjectAutomatorSpecification%
              %include error-handler.dsp%
          %onerror%
              %loop -struct%
                  <tr><td>%value $key%=%value%</td></tr>
              %endloop%
          %endinvoke%
      %endif%
    </TABLE>
    
    <FORM name="syncForm" method="POST" action="http://localhost:3005/pushCode">
    <TABLE width="100%">
        <BR>
    
        <TR>		
            <TD valign="top">
            
                <TABLE width="100%" class="tableForm">
                    %ifvar /isAuth equals('true')% 
                    <TR>
                        <TD class="heading" colspan="2">Sync Details</TD>
                    </TR>
                    
                    <SCRIPT>resetRows();</SCRIPT>				
                    <TR>                     
                                   <TR>
                                        <TD class="oddrow">Branch Name</TD>
                                        <TD class="oddrow-l">
                                            <select class="branchType" id="branchType" name="branchType">
                                                <option value="bugfix/" data-sync="master">bugfix</option>
                                                <option value="feature/" data-sync="develop" selected>feature</option>
                                                <option value="hotfix/" data-sync="master">hotfix</option>
                                                <option value="release/" data-sync="master">release</option>
                                                <option value="other" data-sync="master">other</option>
                                              </select>
                                            
                                            <INPUT name="branchName" type="text" size="28" id="branchName" value=%value projectName%  />
                                        </TD>
                                    </TR>
                                    <tr>
                                        <TD class="oddrow" value ="message">Commit Message</TD>
                                        <TD class="oddrow-l">
                                          <INPUT name="message" size="28" maxlength="32">
                                        </TD>
                                        </TR>
                                      </TR>
                                      <TR>
                                        <TD colspan="2" class="action">					
                                                <button style="width:150" align="center" id="pushCode" >Push Code</button>
                                            </TD>
                                        </TR>
                       
                        </TD>
                    </TR>				
                    %endif%
    
            </TD>
            
        </TR>
        
    </TABLE>
    </FORM>
    <script>
         
    </script>
    
    </script>
    
    </BODY>
    </HTML>
    