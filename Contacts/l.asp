[<a href="<%=QS%>contacts">通訊錄</a>]
[<a href="<%=QS%>contacts&SP=add">增加</a>]
[<a href="<%=QS%>contacts&SP=groups">團體</a>]
<br>
<%
if(sp!="groups") Response.Write("<br>");
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
      case "email" :
       	 %><!--#include file="cemail.asp" --><%
         break;
      case "groups" :
       	 %><!--#include file="groups/l.asp" --><%
         break;
      default:
%>
This page can not be found ( <B><%=sp%></B>)<br>
<%
	}
%>	

