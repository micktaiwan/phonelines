<%@ language="javascript"%>
<!--#include file="../../../func.asp"-->
<!--#include file="../../../virtual.asp"-->
<%

   var usedqty = String(Request("USEDQTY"));
   var surplus = String(Request("SURPLUS"));
   var loss = String(Request("LOSS"));
   var matid = GetSession("TEAMJOBADD2MATID");

   var obj = Server.CreateObject("MATech.Engine");
   obj.SetDB(DB,"sa","engine");

   sql = "INSERT INTO BOMTEAMJOB (TEAM,DATE,WORKID,JOBID,PICTURECODE,SUBJECTID,USEDQTY,SURPLUS,LOSS,MATID) VALUES ('"+GetSession("TEAMJOBADD2TEAM")+"','"+GetSession("TEAMJOBADD2DATE")+"','"+GetSession("TEAMJOBADD2WORKID")+"','"+GetSession("TEAMJOBADD2JOBID")+"','"+GetSession("TEAMJOBADD2PICTURECODE")+"','"+GetSession("TEAMJOBADD2ITEMID")+"','"+usedqty+"','"+surplus+"','"+loss+"','"+matid+"')";
   //Response.Write(sql);
   obj.Execute(sql);
   obj = "";
   Response.Redirect("../../../l.asp?bom=1&P=teamjob&SP=add2-1");
%>
