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
   var m = String(Request("M"));
   var w = String(Request("W"));
   var obj = Server.CreateObject("MATech.Engine");
   obj.SetDB(DB,"sa","engine");
   obj.NewQuery("SELECT ID AS MATERIALID, NAME AS MNAME from BOMMATERIAL where code='"+m+"'");
   obj.NewTemplate(SitePath+"bom\\material\\team\\confirm1.wet");
   obj.DirectResponse = 1;
   mat  = obj.GenerateString(0,0);
   obj = "";
   if(mat=="") Response.Write("<tr><td>材料名稱:</td><td><strong>錯誤</strong></td></tr>");
   else Response.Write(mat);
%>
<tr><td>&nbsp;</td><td>
<% if(mat!="") { %>
<input class="linkbut" type="button" onclick="f=window.opener.document.addform; g=document.confirm; f.MATERIALID.value=g.MATERIALID.value; f.submit();self.close();" value="正確">
<% } %><input class="linkbut" type="button" onclick="self.close();" value="取消"></td></tr>
</form>
</table>
</center>
</div>
</body>
</html>
