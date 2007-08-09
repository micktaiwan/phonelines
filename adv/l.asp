<%
   if(GetSession("PHONEADMIN") == "5") {
%>
[<a href="l.asp?P=adv&SP=add">增加廣告</a>]<br>
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
      	}// switch
   	}// admin
%>

