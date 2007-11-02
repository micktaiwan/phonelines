<a href="l.asp?P=cal">月曆</a> /
<a href="l.asp?P=cal&SP=all">行事曆總覽</a> /
<a onclick="if(!confirm('確認刪除?')) return false;" href="calendar/delpastevents.asp">刪除過去行事曆</a>
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
      case "all" :
       	 %><!--#include file="call.asp" --><%
         break;
      default:
%>
This page can not be found ( <B><%=sp%></B>)<br>
<%
	}
%>

