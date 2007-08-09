<%@ language="javascript"%>
<!--#include file="../func.asp"-->
<%
   Session("AJAX_MAINTABLE")  = "mat";
   Session("AJAX_SECTABLE")   = "matused";
   Session("AJAX_NAME")       = "³]³Æ";
   p = und(Request("P"));
   sp = und(Request("SP"));   
   Response.Redirect("../l.asp?P="+p+"&SP="+sp);
%>
