<%@ language="javascript"%>
<!--#include file="../../virtual.asp"-->
<!--#include file="../../func.asp" -->
<%
// used on the main input page to get all gifts and mat used for the given date, team and phone
// return 2 lists: gifts and mat separated by ";"
// gifts: code,nb,code,nb,...
// mat: code,nb,mat,code,nb,mat,...
// ex: 1,1,2,2;1,1,MAC1,2,2,MAC2
try {
   
   }
catch(e) {
   Response.Write("get_all.asp error: "+escape(String(e)));
   }
%>1,1,2,2;1,1,MAC1,2,2,MAC2
