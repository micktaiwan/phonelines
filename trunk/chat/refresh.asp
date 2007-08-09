<%@ language="javascript"%>
<!--#include file="../virtual.asp"-->
<!--#include file="func.asp"-->
<%
   var obj = Server.CreateObject("MATech.Engine");
   obj.SetDB(DB,"sa","engine");
   if(GetSession("")!="") {
      Response.Write(1);
      }
   else {
      Response.Write(0);
      //obj.Execute("INSERT INTO CHATVISITORS (IP,NAME) VALUES ('','test')");%>
      <!--#include file="ctree.asp"--><%
      }
   obj = "";
%>
