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

   obj.Open("SELECT ID from BOMDATA where idnumber='"+w+"'");
   var workid = obj.Field("ID");
   //var wname  = obj.Field("NAME");
   Session("matrequestWORKID")   = workid;
   Session("matrequestWORKCODE") = w;

   obj.NewQuery("SELECT ID AS MATERIALID, NAME AS MNAME from BOMMATERIAL where code='"+m+"'");
   obj.NewTemplate(SitePath+"bom\\material\\request\\confirm1.wet");
   obj.NewQuery("SELECT ID AS WORKID, NAME AS WNAME from BOMDATA where idnumber='"+w+"'");
   obj.NewTemplate(SitePath+"bom\\material\\request\\confirm2.wet");
   obj.DirectResponse = 1;
   mat  = obj.GenerateString(0,0);
   work = obj.GenerateString(1,1);
   obj = "";
   if(mat=="") Response.Write("<tr><td>材料名稱:</td><td><strong>錯誤</strong></td></tr>");
   else Response.Write(mat);
   if(work=="") Response.Write("<tr><td>工程名稱:</td><td><strong>錯誤</strong></td></tr>");
   else Response.Write(work);
%>
<tr><td>&nbsp;</td><td>
<% if(mat!="" && work!="") { %>
<input class="linkbut" type="button" onclick="f=window.opener.document.addform; g=document.confirm; f.MATERIALID.value=g.MATERIALID.value; f.WORKID.value=g.WORKID.value; f.submit();self.close();" value="正確">
<% } %><input class="linkbut" type="button" onclick="self.close();" value="取消"></td></tr>
</form>
</table>
</center>
</div>
</body>
</html>
