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
   var mat = String(Request("MAT"));
   Response.Write("§÷®Æ¥N½X:	: "+mat+"<br>");
   var obj = Server.CreateObject("MATech.Engine");
   obj.SetDB(DB,"sa","engine");
%>
<form name="addform">
<select name="MAT">
<%
   obj.ClearAll();
   obj.NewQuery("SELECT CODE, NAME from BOMMATERIAL where CODE LIKE '"+mat+"%' ORDER BY CODE");
   obj.NewTemplate(SitePath+"bom/material/request/choosemat.wet");
   obj.Generate(0,0);
%>
</select>
<input type="button" onclick="window.opener.document.<%=formname%>.<%=fieldname%>.value=document.addform.MAT.value;if('<%=formname%>'!='addform') window.opener.document.<%=formname%>.submit();self.close();" value="Choose">
</form>
</div>
</body>
</html>
