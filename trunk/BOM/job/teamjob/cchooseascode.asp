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
   var item       = String(Request("ITEM"));
   Response.Write("加減點代號: "+item+"<br>");
   var obj = Server.CreateObject("MATech.Engine");
   obj.SetDB(DB,"sa","engine");
%>

<form name="addform">
<select name="CODE">
<%
   obj.ClearAll();
   obj.NewQuery("SELECT CODE,DESCR from BOMASCODE where CODE LIKE '"+item+"%' ORDER BY CODE");
   obj.NewTemplate(SitePath+"bom/job/teamjob/chooseascode.wet");
   obj.Generate(0,0);
%>
</select>
<input type="button" onclick="window.opener.document.<%=formname%>.<%=fieldname%>.value=document.addform.CODE.value;if('<%=formname%>'!='addform') window.opener.document.<%=formname%>.submit();self.close();" value="Choose">
</form>
</div>
</body>
</html>
