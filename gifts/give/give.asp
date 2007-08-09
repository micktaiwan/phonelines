

pas utilise


<%@ language="javascript"%>
<!--#include file="../../virtual.asp"-->
<!--#include file="../../func.asp"-->
<!--#include file="../get_vars.asp"-->
<%
   // search the record
   var team = String(Request("TEAM"));
   var date = String(Request("DATE"));
   //Response.Write(team+"<br>");
   //Response.End();

   var phone   = String(Request("PHONE"));
   var nb      = String(Request("NB"));
   var mainid  = String(Request("MAINID"));

   var obj = Server.CreateObject("MATech.Engine");
   obj.SetDB(DB,"sa","engine");

   obj.Open("SELECT TOP 1 ID FROM VISITS WHERE team='"+team+"' AND DATE='"+date+"' AND phone='"+phone+"'");
   var visitid = obj.Field("ID");
   //Response.Write("visitid="+visitid+"<br>");

   if(visitid=="") {
      Response.Write("<center><img src='../../images/questionmark.gif'><br><br><strong>¿ù»~</strong>: §ä¤£¨ì°O¿ý</center>");
      obj = "";
      Response.End();
      }

   // Verify that this visitid was not already used

   obj.Open("SELECT TOP 1 ID FROM "+sectable+" WHERE visitid='"+visitid+"'");
   var gid = obj.Field("ID");
   //Response.Write("gid="+gid+"<br>");

   if(gid!="") {
      Response.Write("<center><img src='../../images/questionmark.gif'><br><br><strong>¿ù»~</strong>: Already used "+sectable+" id</center>");
      obj = "";
      Response.End();
      }


   obj.Execute("INSERT INTO "+sectable+" (VISITID, MAINID, NB) VALUES ('"+visitid+"','"+mainid+"','"+nb+"')");
   obj = "";
   Response.Write("OK");
   Response.End();
   Response.Redirect("../../l.asp?P=gifts&SP=given");
%>
