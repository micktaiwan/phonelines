<img src="images/reporters.gif"><br>
<br>
<%
if(admin=="5") {
%>
[ <a href="l.asp?P=reporters">�q�����</a> ]
[ <a href="l.asp?P=reporters&SP=add">��J���</a> ]
[ <a href="l.asp?P=reporters&SP=smshn">²�T�b��</a> ]
[ <a href="<%=QS%>reporters&SP=groups">����</a> ]
<br>
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
      case "smshn" :
       	 %><!--#include file="smshn/l.asp" --><%
         break;
      case "groups" :
       	 %><!--#include file="groups/l.asp" --><%
         break;
      default:
%>
This page can not be found ( <B><%=sp%></B>)<br>
<%
	}
}	
else Response.Write("<strong>You do not have access to this page</strong>");
   %>	
