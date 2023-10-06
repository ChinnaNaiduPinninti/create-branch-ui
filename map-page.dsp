<HTML>

<HEAD>

    <META http-equiv="Pragma" content="no-cache">

    <META http-equiv="Content-Type" content="text/html; charset=UTF-8">

    <META http-equiv="Expires" content="-1">

    <LINK href="css/webMethods.css" type="text/css" rel="stylesheet">

    <SCRIPT src="js/webMethods.js"></SCRIPT>

</HEAD>

<BODY>
    <FORM name="exportProjectToProjectAutomator" method="POST" action="map-page.dsp">
        <TABLE width="100%">

            <TR>

                <TD class="menusection-DeployerTools"> Target Mapping Page

                </TD>

            </TR>

        </TABLE>

         <!- Determine if this user is empowered to project creation/copy stuff ->

      %invoke wm.deployer.UIAuthorization:isAuthorized%

      %endinvoke%

    <TABLE width="100%">  

      %ifvar action equals('map-page')%

          %invoke wm.deployer.Util:exportProjectToProjectAutomatorSpecification%

              %include error-handler.dsp%

          %onerror%

              %loop -struct%

                  <tr><td>%value $key%=%value%</td></tr>

              %endloop%

          %endinvoke%

      %endif%
    

        </TABLE>



        <FORM name="Target Mapping" method="POST" action="map-page.dsp">

            <TABLE width="100%">

                <BR>



                <TR>

                    <TD valign="top">



                        <TABLE width="100%" class="tableForm">

                            %ifvar /isAuth equals('true')%

                            <TR>

                                <TD class="heading" colspan="2">Target Mapping</TD>

                            </TR>

                            <INPUT type="hidden" VALUE="TargetMapping" name="action">

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

                <TR>

                    <SCRIPT>writeTD('row-l', 'width="25%" style="text-align:right;"');</SCRIPT> Change Number

                    <TD><input type="text" id="number_input" disabled /></TD>

                </TR>

                %endif%

                </TD>

                </TR>

                <TR>
                    <TD colspan="2" class="action">
                        <INPUT type="submit" style="width:150" align="center" value="Get Snippet">
                    </TD>
                </TR>

        </form>
        %invoke AIA_CICD_ProjectAutomator.v1.services:getXMLMain%
        <textarea id="xmlInput" style="height: 131px; width: 681px;">%value xmldata%</textarea>
        %endinvoke%
        </br></br>
        </td>

        </tr>

        </table>

        </br>

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

                } else {

                    input.disabled = false;

                    input.value = ''

                }

            }

        </script>



        </br>

        </TR>

        </TABLE>



        %invoke AIA_CICD_ProjectAutomator.v1.services:getXMLMain%
        <textarea id="xmlInput" style="height: 131px; width: 681px;">%value xmldata%</textarea>
        </br></br>

        <!-- <button onclick="alert('got snippest successfully');">Get Snippet</button>-->

        <INPUT type="submit" style="width:150" align="center" value="Get Snippest">
        %endinvoke%

        <button type="button" onclick="copyXML()">

            Copy Snippet

        </button>



        <button onclick="alert('Submitted Successfully');">Submit</button>



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

        </script>

    </FORM>

</BODY>

</HTML>