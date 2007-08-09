<%
   if(GetSession("PHONEADMIN") == "5") {
%>
[<a href="l.asp?P=reporters&SP=smshn&SP2=add">¿é¤J¸ê®Æ</a>]<br>
<br>
<%
    switch(sp2.toLowerCase()) {
      case "" :
      case "undefined" :
      case "welcome" :
       	 %><!--#include file="ctree.asp" --><%
         break;
      case "add" :
       	 %><!--#include file="cadd.asp" --><%
         break;
      case "edit" :
       	 %><!--#include file="cedit.asp" --><%
         break;
      default:
%>
This page can not be found ( <B><%=sp2%></B>)<br>
<%
	}
%>	

<%
   }
%>
