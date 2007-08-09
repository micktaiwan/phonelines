<%@ language="javascript"%>
<%
   Session("ORGANLANGUAGE") = String(Request("K"));
   Response.Redirect("l.asp");
%>