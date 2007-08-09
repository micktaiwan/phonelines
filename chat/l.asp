<%@ Language=Javascript %>
<!--#include file="../virtual.asp"-->
<!doctype html public "-//w3c//dtd html 4.0 transitional//en">
<html>
<html>
<head>
   <meta http-equiv="Content-Type" content="text/html;">
   <meta name="Author" content="Mickael (Programmation)">
   <meta http-equiv='Cache-Control' content='no-cache, must-revalidate'>
   <meta http-equiv='Pragma' content='no-cache'>
	<title>Ajax Chat</title>
   <link REL=STYLESHEET HREF="styles.css" TYPE="text/css">
	<script src="../js/majax.js" type="text/javascript"></script>
	<script src="chat.js" type="text/javascript"></script>
   <script language="javascript" src="../js/nifty.js"></script>
   <script language="javascript" src="../js/jswin/jswin.js"></script>
	<link REL=STYLESHEET HREF="nifty.css" TYPE="text/css">
	<link REL=STYLESHEET HREF="../js/jswin/winstyle.css" TYPE="text/css">
</head>
<body text="#000000" bgcolor="#FFFFFF">
<h1>Ajax Chat</h1>
<a href="#" onclick="var w = winList['sample1']; if (w) w.open(); w.frame.style.left = '50px;'; w.frame.style.top = '100px;';return false;">Chat Window</a>

<div id="sample1" class="window" style="left:50px;top:100px;width:450px;">
  <div class="titleBar">
    <span class="titleBarText">Chat</span>
    <img class="titleBarButtons" alt="" src="../js/jswin/images/buttons.gif" usemap="#sampleMap1" />
    <map id="sampleMap1" name="sampleMap1">
      <area shape="rect" coords="0,0,15,13"  href="" alt="" title="Minimize" onclick="this.parentWindow.minimize();return false;" />
      <area shape="rect" coords="16,0,31,13" href="" alt="" title="Restore"  onclick="this.parentWindow.restore();return false;" />
      <area shape="rect" coords="34,0,49,13" href="" alt="" title="Close"    onclick="this.parentWindow.close();return false;" />
    </map>
  </div>
  <div class="clientArea" style="height:440px;">
      Enter your name and what you want to say...<br>
      <input type="text" name="name" id="name" value="" size="10">
      <input type="text" name="text" id="text" value="" size="40" onkeyup="ontextkup(event)">
      <input type="button" name="add" value="Send" onclick="add(); return false;">
      <div id="status">&nbsp;</div>
      <div id="result"></div>
      <img id="refresh" width="21" height="21" src="images/bk.gif">
  </div>
</div>

<script>
round();
winInit();
if (winList['sample1']) winList['sample1'].open();
refresh();
</script>

</body>
</html>
