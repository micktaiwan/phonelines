<%@ language="javascript"%>
<%

   var link = String(Request("L"));
   var k = String(Request("K"));

   var obj = Server.CreateObject("MATech.Engine");
   obj.SetDB("organizer","sa","engine");
   obj.Execute("UPDATE LINKS SET VIEWS = ISNULL(VIEWS,0)+1 WHERE (ID = '"+k+"')");
   obj = "";

   Response.Redirect(link);
   
%>
