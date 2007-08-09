<%@ language="javascript"%>
<!--#include file="../virtual.asp"-->
<%
   var k = String(Request("K"));
   var obj = Server.CreateObject("MATech.Engine");
   obj.SetDB(DB,"sa","engine");
   obj.Execute("UPDATE BANNERS SET NBVIEW=0, NBCLICK=0, RESETDATE=GETDATE() WHERE ID='"+k+"'")
   obj = "";
   Response.Redirect("../l.asp?P=adv&SP=edit&K="+k);
%>
