<%@ language="javascript"%>
<!--#include file="../../../virtual.asp" -->
<html>
<head>
   <LINK REL=STYLESHEET HREF="../../../styles.css" TYPE="text/css">
</head>
<body bgcolor="#FFFFFF" text="black">
<div style="padding:10px;border:2px dashed #AA0000;">
<%
   var formname   = String(Request("FORMNAME"));
   var fieldname  = String(Request("FIELDNAME"));
   var work       = String(Request("JOB"));
   Response.Write("�u�@�渹: "+work+"<br>");
   var obj = Server.CreateObject("MATech.Engine");
   obj.SetDB(DB,"sa","engine");
%>

<form name="addform">
<select name="ITEM">
<%
   obj.ClearAll();
   obj.NewQuery("SELECT ID, CODE, JOBCODE from BOMJOB where JOBCODE LIKE '"+work+"%'");
   obj.NewTemplate(SitePath+"bom/job/teamjob/choosejob.wet");
   obj.Generate(0,0);
%>
</select>
<input type="button" onclick="window.opener.document.<%=formname%>.<%=fieldname%>.value=document.addform.ITEM.value;if('<%=formname%>'!='addform') window.opener.document.<%=formname%>.submit();self.close();" value="Choose">
</form>
</div>
</body>
</html>
