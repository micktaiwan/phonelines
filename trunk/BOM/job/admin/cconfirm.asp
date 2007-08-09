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
   obj.NewQuery("SELECT ID from BOMJOB where code='"+k+"'");
   obj.NewTemplate(MMSitePath+"id.wet");
   jobid = obj.GenerateString(0,0);
   obj.NewQuery("SELECT ID, JOBCODE from BOMJOB where code='"+k+"'");
   obj.NewTemplate(SitePath+"bom\\job\\admin\\confirm1.wet");
   obj.NewQuery("SELECT ID AS TEAMID, TEAM from BOMTEAM where jobid='"+jobid+"'");
   obj.NewTemplate(SitePath+"bom\\job\\admin\\confirm2.wet");
   obj.DirectResponse = 1;
   mat1  = obj.GenerateString(1,1);
   mat2  = obj.GenerateString(2,2);
   obj = "";
   if(mat1=="") Response.Write("<tr><td>工作單編號:</td><td><strong>錯誤</strong></td></tr>");
   else Response.Write(mat1);
   if(mat2=="") Response.Write("<tr><td>班別:</td><td><strong>錯誤</strong></td></tr>");
   else Response.Write(mat2);
%>
<tr><td>&nbsp;</td><td>
<% if(mat1 != "" && mat2 != "") { %>
<input class="linkbut" type="button" onclick="f=window.opener.document.addform; f.JOBID.value=document.confirm.JOBID.value; f.submit();self.close();" value="正確">
<% } %><input class="linkbut" type="button" onclick="self.close();" value="取消"></td></tr>
</form>
</table>
</center>
</div>
</body>
</html>
