<%@ language="javascript"%>
<!--#include file="../../../virtual.asp" -->
<html>
<head>
   <LINK REL=STYLESHEET HREF="../../../styles.css" TYPE="text/css">
</head>
<body bgcolor="#FFFFFF" text="black">
<div style="padding:20px;">
<center>

<table style="font-size:12pt;" border="0" cellspacing="1" cellpadding="5">
<form name="confirm">
<%
   var k = String(Request("K"));
   var obj = Server.CreateObject("MATech.Engine");
   obj.SetDB(DB,"sa","engine");
   obj.NewQuery("SELECT ID, JOBCODE from BOMJOB where code='"+k+"'");
   obj.NewTemplate(SitePath+"bom\\job\\team\\confirm1.wet");
   obj.DirectResponse = 1;
   mat  = obj.GenerateString(0,0);
   obj = "";
   if(mat=="") Response.Write("<tr><td>工作單編號:</td><td><strong>錯誤</strong></td></tr><input type=\"hidden\" name=\"JOBID\" value=\"-1\">");
   else Response.Write(mat);
%>
<tr><td>&nbsp;</td><td>
<%// if(mat!="") { %>
<input class="linkbut" type="button" onclick="f=window.opener.document.addform; f.JOBID.value=document.confirm.JOBID.value; f.submit();self.close();" value="正確">
<%// } %>
<input class="linkbut" type="button" onclick="self.close();" value="取消"></td></tr>
</form>
</table>
</center>
</div>
</body>
</html>
