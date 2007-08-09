<%
    switch(sp2.toLowerCase()) {
      case "" :
      case "undefined" :
      case "welcome" :
       	 %><!--#include file="cdate.asp" --><%
         break;
      case "all" :
       	 %><!--#include file="ctree.asp" --><%
         break;
      case "today" :
       	 %><!--#include file="ctoday.asp" --><%
         break;
      default:
%>
This page can not be found ( <B><%=sp%></B>)<br>
<%
	}
%>	

