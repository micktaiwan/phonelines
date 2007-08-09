<%@ language="javascript"%>
<!--#include file="../func.asp"-->
<%
   Session("AJAX_MAINTABLE")  = "gifts";
   Session("AJAX_SECTABLE")   = "giftgiven";
   Session("AJAX_NAME")       = "ÃØ«~";
   p = und(Request("P"));
   sp = und(Request("SP"));   
   Response.Redirect("../l.asp?P="+p+"&SP="+sp);
%>
