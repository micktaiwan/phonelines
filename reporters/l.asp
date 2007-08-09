<img src="images/reporters.gif"><br>
<br>
<%
if(admin=="5") {
%>
[ <a href="l.asp?P=reporters">通報單位</a> ]
[ <a href="l.asp?P=reporters&SP=add">輸入資料</a> ]
[ <a href="l.asp?P=reporters&SP=smshn">簡訊帳號</a> ]
[ <a href="<%=QS%>reporters&SP=groups">團體</a> ]
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
