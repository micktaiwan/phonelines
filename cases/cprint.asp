<%@ language="javascript"%>
<!--#include file="../virtual.asp" -->
<!--#include file="../func.asp" -->
<HTML>
<HEAD>
   <META HTTP-EQUIV="Content-Type" CONTENT="text/html; charset=BIG5">
   <LINK REL=STYLESHEET HREF="../styles.css" TYPE="text/css">
   <script  LANGUAGE="JavaScript" SRC="forside.js"></script>
   <title>�Ȥ�޲z�t��</title>
</HEAD>
<body text="#000000" bgcolor="#FFFFFF" link="#0078F0" vlink="#005AB4" alink="#FF6600" topmargin="10" leftmargin="10" marginwidth="10" marginheight="10">
<%
   var id = GetSession("PHONEID");
   if(id=="undefined") Response.End();
%>

<table width="100%" cellpadding="3" cellspacing="1" bgcolor="#000000">
<tr style="text-align:center;font-weight:bold;" BGCOLOR="white">
<td>�U��</td>
<td>�ۼо���</td>
<td>�u�{�s��</td>
<td>�u�{�W��</td>
<td>��д���</td>
<td>���</td>
<td>�г�O��</td>
<td>�}�Ф��</td>
<td>�i������</td>
<td>�I��<!--�w����B--></td>
<td>���i</td>
</tr><%
   var obj = Server.CreateObject("MATech.Engine");
   obj.SetDB(DB,"sa","engine");

   obj.ClearAll();
   obj.NewQuery("SELECT * FROM CASES WHERE BIDLIMIT >= getdate()-1 ORDER BY BIDLIMIT");
   obj.NewTemplate(SitePath+"cases/print.wet");

   obj.DirectResponse = 1;
   obj.Generate(0,0);
   obj = "";
%>
</table>

</body>
</html>
