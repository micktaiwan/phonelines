<img src="images/dispatch.gif"><br>
<br>
<%
if(GetSession("PHONEADMIN")!="0") {
%>
[ <a href="l.asp?P=dispatch&SP=add">��J���</a> ]
[ <a href="l.asp?P=dispatch&SP=print">�A���C�L</a> ]
<br>
<%}%>
<br>
<%
    switch(sp.toLowerCase()) {
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
This page can not be found ( <B><%=sp%></B>)<br>
<%
	}
%>	

