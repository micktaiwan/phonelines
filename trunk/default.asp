<%@ language="javascript"%>
<!--#include file="func.asp"-->
<%
   if(String(Session("PHONEID")) == "undefined")
      Response.Redirect("clogin.asp");
   Response.Redirect("l.asp?"+GetSession("PHONEQS"));
%>
