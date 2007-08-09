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
   var work       = String(Request("WORK"));
   Response.Write("¤uµ{½s¸¹: "+work+"<br>");
   var obj = Server.CreateObject("MATech.Engine");
   obj.SetDB(DB,"sa","engine");
%>

<form name="addform">
<select name="ITEM">
<%
   obj.ClearAll();
   obj.NewQuery("SELECT IDNUMBER,NAME from BOMDATA where IDNUMBER LIKE '"+work+"%' ORDER BY IDNUMBER");
   obj.NewTemplate(SitePath+"bom/material/request/choosework.wet");
   obj.Generate(0,0);
%>
</select>
<input type="button"
onclick="f=window.opener.document.<%=formname%>;f.WORKNAME.value='test';f.<%=fieldname%>.value=document.addform.ITEM.value;if('<%=formname%>'!='addform') window.opener.document.<%=formname%>.submit();self.close();"
value="Choose">
</form>
</div>
</body>
</html>
