<HTML>

	<HEAD>
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
				<TD class="menusection-DeployerTools" colspan="4"> Map and get Xml file
				</TD>
			</TR>
		</TABLE>
		<!- Determine if this user is empowered to project creation/copy stuff ->
			%invoke wm.deployer.UIAuthorization:isAuthorized%
			%endinvoke%
			<TABLE width="100%">
				%ifvar action equals('exportToMapping')%
				%invoke wm.deployer.Util:exportProjectToProjectAutomatorSpecification%
				%include error-handler.dsp%
				%onerror%
				%loop -struct%
				<tr>
					<td>%value $key%=%value%</td>
				</tr>
				%endloop%
				%endinvoke%
				%endif%
			</TABLE>

		
			<FORM name="exportToMapping" method="POST" action="exportToMapping.dsp">
				<TABLE width="100%">
					<BR>
	
					<TR>
						<TD valign="top">
	
							<TABLE width="100%" class="tableForm">
								%ifvar /isAuth equals('true')%
								<TR>
									<TD class="heading" colspan="2">Export Project to Mapping</TD>
								</TR>
								<INPUT type="hidden" VALUE="exportToMapping" name="action">
								<INPUT type="hidden" VALUE="true" name="exportedFromUI">
	
								<SCRIPT>resetRows();</SCRIPT>
								<TR>
									<SCRIPT>writeTD('row-l', 'width="25%" style="text-align:right;"');</SCRIPT>Project
						</TD>
						<SCRIPT>writeTD('row-l'); swapRows();</SCRIPT>
						<select class="projectName" name="projectName">
							<option value="%value projectName%">%value projectName%</option>
						</select>
						</TD>
					</TR>
					<TR>
	
	
						<SCRIPT>writeTD('row-l', 'width="25%" style="text-align:right;"');</SCRIPT>Environment
	
	
	
						<TD> <select id="filter_for" name="filter_for" onchange="handleSelectChange()">
	
								<option value="SelectEnv">SelectEnv</option>
	
								<option value="DEV">DEV</option>
	
								<option value="SIT">SIT</option>
	
								<option value="UAT">UAT</option>
	
								<option value="PROD">PROD</option>
	
								<option value="PREPROD">PREPROD</option>
	
							</select></TD>
	
					</TR>
	
					<TR id="changeNo">
	
						<SCRIPT>writeTD('row-l', 'width="25%" style="text-align:right;"');</SCRIPT> Change Number
	
						<TD><input type="text" id="number_input" disabled /></TD>
	
					</TR>
	
	
					<TR hidden>
						<SCRIPT>writeTD('row-l', 'width="25%" style="text-align:right;"');</SCRIPT>Export Alias Definition
						</TD>
	
						<SCRIPT>writeTD('row-l'); swapRows();</SCRIPT> <input type="checkbox" name="exportAliasDefinition"
							id="exportAliasDefinition" checked="checked" />
						</TD>
					</TR>
					<TR hidden>
						<SCRIPT>writeTD('row-l', 'width="25%" style="text-align:right;"');</SCRIPT>Export Deployment and
						Deletion Set Definition</TD>
	
						<SCRIPT>writeTD('row-l'); swapRows();</SCRIPT> <input type="checkbox"
							name="exportDeploymentSetDefinition" id="exportDeploymentSetDefinition" checked="checked" />
						</TD>
					</TR>
					<TR hidden>
						<SCRIPT>writeTD('row-l', 'width="25%" style="text-align:right;"');</SCRIPT>Export Build Definition
						</TD>
	
						<SCRIPT>writeTD('row-l'); swapRows();</SCRIPT> <input type="checkbox" name="exportBuildDefinition"
							id="exportBuildDefinition" checked="checked" />
						</TD>
					</TR>
					<TR hidden>
						<SCRIPT>writeTD('row-l', 'width="25%" style="text-align:right;"');</SCRIPT>Export Map Definition
						</TD>
	
						<SCRIPT>writeTD('row-l'); swapRows();</SCRIPT> <input type="checkbox" name="exportMapDefinition"
							id="exportMapDefinition" checked="checked" />
						</TD>
					</TR>
					<TR hidden>
						<SCRIPT>writeTD('row-l', 'width="25%" style="text-align:right;"');</SCRIPT>Export Deployment
						Candidate Definition</TD>
	
						<SCRIPT>writeTD('row-l'); swapRows();</SCRIPT> <input type="checkbox"
							name="exportDeploymentCandidateDefinition" id="exportDeploymentCandidateDefinition"
							checked="checked" />
						</TD>
					</TR>
					%endif%
	
					</TD>
	
					</TR>
	
					<TR>
						<TD colspan="2" class="action">
							<INPUT type="submit" style="width:150" align="center" value="Get Snippet">
						</TD>
					</TR>
	
	
				</TABLE>
				<script>
	
					function handleSelectChange() {
	
						var select = document.getElementById('filter_for');
	
						var input = document.getElementById('number_input');
	
	
	
						if (select.value === 'SIT') {
	
							input.disabled = true;
	
							input.value = '';
	
	
	
						} else if (select.value === 'SelectEnv') {
	
							input.disabled = true;
	
							input.value = ''
	
						}
						else {
	
							input.disabled = false;
	
							input.value = ''
	
						}
	
					}
	
				</script>
			</FORM>
				<FORM name="exportToMappings" method="post" action=\invoke\AIA_CICD_ProjectAutomator.v1.services:saveXml target="response">
					
						<TABLE width="100%">
							<BR>
			
							<TR>
								<TD valign="top">
			
									%ifvar /isAuth equals('true')%
			
			
								</TD>
			
								<SCRIPT>writeTD('row-l'); swapRows();</SCRIPT>
			
								<select style="display: none;" typeclass="projectName" name="projectName">
									<option value="%value projectName%">%value projectName%</option>
								</select>
			
								</TD>
							</TR>
							<TR>
			
			
							<TR hidden>
								<SCRIPT>writeTD('row-l', 'width="25%" style="text-align:right;"');</SCRIPT>Export Alias Definition
								</TD>
			
								<SCRIPT>writeTD('row-l'); swapRows();</SCRIPT> <input type="checkbox" name="exportAliasDefinition"
									id="exportAliasDefinition" checked="checked" />
								</TD>
							</TR>
							<TR hidden>
								<SCRIPT>writeTD('row-l', 'width="25%" style="text-align:right;"');</SCRIPT>Export Deployment and
								Deletion Set Definition</TD>
			
								<SCRIPT>writeTD('row-l'); swapRows();</SCRIPT> <input type="checkbox"
									name="exportDeploymentSetDefinition" id="exportDeploymentSetDefinition" checked="checked" />
								</TD>
							</TR>
							<TR hidden>
								<SCRIPT>writeTD('row-l', 'width="25%" style="text-align:right;"');</SCRIPT>Export Build Definition
								</TD>
			
								<SCRIPT>writeTD('row-l'); swapRows();</SCRIPT> <input type="checkbox" name="exportBuildDefinition"
									id="exportBuildDefinition" checked="checked" />
								</TD>
							</TR>
							<TR hidden>
								<SCRIPT>writeTD('row-l', 'width="25%" style="text-align:right;"');</SCRIPT>Export Map Definition
								</TD>
			
								<SCRIPT>writeTD('row-l'); swapRows();</SCRIPT> <input type="checkbox" name="exportMapDefinition"
									id="exportMapDefinition" checked="checked" />
								</TD>
							</TR>
							<TR hidden>
								<SCRIPT>writeTD('row-l', 'width="25%" style="text-align:right;"');</SCRIPT>Export Deployment
								Candidate Definition</TD>
			
								<SCRIPT>writeTD('row-l'); swapRows();</SCRIPT> <input type="checkbox"
									name="exportDeploymentCandidateDefinition" id="exportDeploymentCandidateDefinition"
									checked="checked" />
								</TD>
							</TR>
							%endif%
			
							</TD>
			
						</TR>
						</TABLE>
					</FORM>
					<iframe name="response" style="display: none;"></iframe>
	
	
			%invoke AIA_CICD_ProjectAutomator.v1.services:getXMLMain%
			<textarea id="xmlInput" style="height: 131px; width: 681px;">%value xmldata%</textarea>
	
			</br></br>
			<button type="button" onclick="copyXML()">
				Copy Snippet
			</button>
			<!-- <button type="button" onclick="copyToClone()"> MAP </button> -->
			<button type="button" onclick="exportToMappings.submit()">
				Save
			</button>
	
			<script>
				function copyXML() {
					let copyXMLText =
						document.getElementById("xmlInput");
	
					copyXMLText.select();
					document.execCommand("copy");
	
					document.getElementById("xml")
						.innerHTML = "Copied the text: "
						+ copyXMLText.value;
				}
	
		
				function copyToClone() {
					var environmentInput = document.getElementById("filter_for").value;
					var changeValueInput = document.getElementById("number_input").value;
	
	
					if (environmentInput === "" || changeValueInput === "") {
	
						if (environmentInput.toUpperCase() === "SIT") {
	
							alert("mapped");
						}
						else {
	
							alert("select valid inputs.");
						}
					}
					else {
	
	
	
					}
	
				}
	
	
			</script>
	
	</BODY>
	
	</HTML>
	
	</HTML>