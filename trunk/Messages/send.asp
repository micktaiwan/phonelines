<%@ language="javascript"%>
<!--#include file="../virtual.asp" -->
<!--#include file="../func.asp" -->
<%
   var obj = Server.CreateObject("MATech.Engine");
   obj.SetDB(DB,"sa","engine");
   obj.Insert("messages");

   var email = String(Request("email"));
   if(email=="1") {
      obj.NewQuery("SELECT TOP 1 * FROM messages ORDER BY ID DESC");
      obj.NewQuery("SELECT ID,NAME,EMAIL FROM members WHERE ID=#");
      obj.NewTemplate(SitePath+"messages\\email.wet");
      obj.NewTemplate(SitePath+"messages\\emailadd.wet");
      obj.DirectResponse = 0;      
      obj.Generate(0,0);
      }

   obj = "";
   Response.Redirect("../l.asp?P=messages&S=1");
%>
