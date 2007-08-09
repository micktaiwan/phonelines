<%@ language="javascript"%>
<!--#include file="../../../func.asp"-->
<!--#include file="../../../virtual.asp"-->
<%

   //Response.Write(GetSession("TEAMJOBADD2DATE"));
   //Response.End();

   var qty = String(Request("QTY"));
   var ascode = String(Request("ASCODE"));

   var obj = Server.CreateObject("MATech.Engine");
   obj.SetDB(DB,"sa","engine");

   obj.ClearAll();
   obj.NewQuery("SELECT ID FROM BOMASCODE WHERE CODE='"+ascode+"'");
   obj.NewTemplate(MMSitePath+"id.wet");
   var asid = obj.GenerateString(0,0);

   sql = "INSERT INTO BOMTEAMJOB (TEAM,DATE,WORKID,JOBID,PICTURECODE,SUBJECTID,QTY,ASID) VALUES ('"+GetSession("TEAMJOBADD2TEAM")+"','"+GetSession("TEAMJOBADD2DATE")+"','"+GetSession("TEAMJOBADD2WORKID")+"','"+GetSession("TEAMJOBADD2JOBID")+"','"+GetSession("TEAMJOBADD2PICTURECODE")+"','"+GetSession("TEAMJOBADD2ITEMID")+"','"+qty+"','"+asid+"')";
   //Response.Write(sql);
   obj.Execute(sql);
   obj = "";
   Response.Redirect("../../../l.asp?bom=1&P=teamjob&SP=add2-1");
%>
