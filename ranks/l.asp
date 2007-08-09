<%
   if(GetSession("PHONEADMIN") == "2") {
%>
<%
    switch(sp.toLowerCase()) {
      case "" :
      case "undefined" :
      case "welcome" :
       	 %><!--#include file="ctree.asp" --><%
         break;
      default:
%>
This page can not be found ( <B><%=sp%></B>)<br>
<%
      	}// switch
   	}// admin
%>

