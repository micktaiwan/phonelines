<%@ language="javascript"%>
<%
   Session("PHONEID") = "undefined";
   Session("PHONEADMIN") = "0";
   Response.Cookies("PHONE")("login") = "undefined";
   Response.Redirect("l.asp");
%>
