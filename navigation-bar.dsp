<LINK href="css/cb2.css" type="text/css" rel="stylesheet">
<SCRIPT src="js/cb2.js"></SCRIPT>
<!--Start: Anurag TraxId # 1-RNADG-->
<script>
function onPressDefinex(){
	document.getElementById("definex").style.backgroundColor="#C1C1C1"
	document.getElementById("definex").style.borderTop="1px solid buttonshadow"
	document.getElementById("definex").style.borderLeft="1px solid buttonshadow"
	document.getElementById("definex").style.borderBottom="1px solid buttonhighlight"
	document.getElementById("definex").style.borderRight="1px solid buttonhighlight"
}
function onPressReleasex(){
	document.getElementById("releasex").style.backgroundColor="#C1C1C1"
	document.getElementById("releasex").style.borderTop="1px solid buttonshadow"
	document.getElementById("releasex").style.borderLeft="1px solid buttonshadow"
	document.getElementById("releasex").style.borderBottom="1px solid buttonhighlight"
	document.getElementById("releasex").style.borderRight="1px solid buttonhighlight"
}
function onPressMapx(){
	document.getElementById("mapx").style.backgroundColor="#C1C1C1"
	document.getElementById("mapx").style.borderTop="1px solid buttonshadow"
	document.getElementById("mapx").style.borderLeft="1px solid buttonshadow"
	document.getElementById("mapx").style.borderBottom="1px solid buttonhighlight"
	document.getElementById("mapx").style.borderRight="1px solid buttonhighlight"
}
function onPressDeployx(){
	document.getElementById("deployx").style.backgroundColor="#C1C1C1"
	document.getElementById("deployx").style.borderTop="1px solid buttonshadow"
	document.getElementById("deployx").style.borderLeft="1px solid buttonshadow"
	document.getElementById("deployx").style.borderBottom="1px solid buttonhighlight"
	document.getElementById("deployx").style.borderRight="1px solid buttonhighlight"
}
</script>
<!--End: Anurag TraxId # 1-RNADG-->

<TABLE class="tableHeader" width="100%" style="border-collapse:separate;">
<TR class="subheading2">
	<TD width="25%" align="middle" id="definex" onclick="onPressDefinex()" style="padding-left:5px;"> 
		<A ID="bundle-list" class="imagelink" target="body" href="define.dsp?projectName=%value -htmlcode projectName%">
			<IMG align="center" ID="define" src="images/define.gif" border="0" width="20" height="20"
				alt="Define the project by identifying assets to deploy">Define</A> <!-- Anurag TraxId # 1-RNADG : changed "</A>Define" to "Define</A>"-->
	</TD>
	<script> 
		var foo = createButton(document.getElementById("definex"), "nav"); 
		foo.setAlwaysUp(true);
		foo.setToggle(true);
	</script>
    <TD width="25%" align="middle" id="definex" onclick="onPressDefinex()" style="padding-left:5px;"> 
		<A ID="bundle-list" class="imagelink" target="body" href="sync-page.dsp?projectName=%value -htmlcode projectName%">
			<IMG align="center" ID="define" src="images/sync.png" border="0" width="20" height="20"
				alt="Define the project by identifying assets to deploy">Sync</A> <!-- Anurag TraxId # 1-RNADG : changed "</A>Define" to "Define</A>"-->
	</TD>
	<TD width="25%" align="middle" id="definex" onclick="onPressDefinex()" style="padding-left:5px;">
    <A ID="bundle-list" class="imagelink" target="body" href="map-page.dsp?projectName=%value -htmlcode projectName%">
        <IMG align="center" ID="define" src="images/map_transformer.gif" border="0" width="20" height="20"
            alt="Define the project by identifying assets to deploy">Target Mapping</A> <!-- Anurag TraxId # 1-RNADG : changed "</A>Define" to "Define</A>"-->
    </TD>

	<TD width="25%" align="middle" id="definex" onclick="onPressDefinex()" style="padding-left:5px;"> 
		<A ID="bundle-list" class="imagelink" target="body" href="exportToProjectAutomator.dsp?projectName=%value -htmlcode projectName%">
			<IMG align="center" ID="define" src="images/automate.gif" border="0" width="20" height="20"
				alt="Define the project by identifying assets to deploy">Project Automator</A> <!-- Anurag TraxId # 1-RNADG : changed "</A>Define" to "Define</A>"-->
	</TD>
	<script> 
		var foo = createButton(document.getElementById("definex"), "nav"); 
		foo.setAlwaysUp(true);
		foo.setToggle(true);
	</script>
	
</TR>
</TABLE>
