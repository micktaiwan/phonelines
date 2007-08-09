<% @ LANGUAGE="JavaScript" %>
<!--#include file="../virtual.asp" -->
<!--#include file="../func.asp" -->
<%
   var password = "918273";
   var bad = 0;
   var sp = String(Request("SP"));
   var p = String(Request("Pass"));
   if(p != password && Session("Pass") != password)
      bad = 1;

   Page = String(Request("P"));
   //Response.Write(Page+"<BR>");
   var obj = Server.CreateObject("MATech.Engine");
   obj.SetDB(DB,"sa","engine");
%>
<HTML>
<HEAD>
   <META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=BIG5">
   <LINK REL=STYLESHEET HREF="../styles.css" TYPE="text/css">
   <script  LANGUAGE="JavaScript" SRC="../forside.js"></script>
</HEAD>
<body text="#000000" bgcolor="#FFFFFF" link="#0078F0" vlink="#005AB4" alink="#FF6600" topmargin="0" leftmargin="0" marginwidth="0" marginheight="0">
<a href="../"><img src="../images/image01.jpg" border="0"></a><br>
<table BORDER=0 CELLSPACING=0 CELLPADDING=0 WIDTH="100%">
<tr>
<td VALIGN=TOP width="150">
<%if(!bad) {%>
<!--#include file="menu.asp" -->
<% } %>
</td>

<td VALIGN=TOP>
<!--#include file="SelectPage.asp" -->

</td>
</tr>
</table>
</!--------------------- END PAGE --------------------->
</body>
</html>
<%
   obj = "";
   var ip = Request.ServerVariables("REMOTE_ADDR");
   if(ip!="127.0.0.1" && ip!="192.168.0.1") {
   	var cfile = Server.Mappath("visitors.txt");
   	var fs = Server.CreateObject("Scripting.FileSystemObject");
   	var out = fs.OpenTextFile(cfile,8,true);
   	out.WriteLine(ip + "\t***\t" + Date() + "\t***\t" + Request.ServerVariables("QUERY_STRING"));
      out = "";
      fs = "";
      }
%>
