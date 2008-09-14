<%@ language="javascript"%>
<!--#include file="../../virtual.asp"-->
<!--#include file="../../func.asp" -->
<%
   var visitid = String(Request("V"));
   var giftid  = String(Request("G"));
   var nb      = String(Request("N"));
   var mac     = String(Request("M"));
   var obj = Server.CreateObject("MATech.Engine");
   obj.SetDB(DB,"sa","engine");

   // Verify that this visitid was not already used

   obj.Open("SELECT TOP 1 ID FROM giftgiven WHERE visitid='"+visitid+"'");
   var gid = obj.Field("ID");
   if(gid!="") {
      Response.Write("Gifts already given for this visit. VisitID="+visitid+".");
      obj = "";
      Response.End();
      }
   obj.Open("SELECT TOP 1 ID FROM matused WHERE visitid='"+visitid+"'");
   var gid = obj.Field("ID");
   if(gid!="") {
      Response.Write("Gifts already given for this visit. VisitID="+visitid+".");
      obj = "";
      Response.End();
      }

   // insert
   g = String(giftid).split(",");
   n = String(nb).split(",");
   m = String(mac).split(",");

   for(i=0;i<5;++i)
      if(n[i]!="0") obj.Execute("INSERT INTO giftgiven (VISITID, MAINID, NB, MAC) VALUES ('"+visitid+"','"+g[i]+"','"+n[i]+"','"+m[i]+"')");
   for(i=5;i<12;++i)
      if(n[i]!="0") obj.Execute("INSERT INTO matused (VISITID, MAINID, NB, MAC) VALUES ('"+visitid+"','"+g[i]+"','"+n[i]+"','"+m[i]+"')");

   Response.Write("0");
   obj = "";
%>
