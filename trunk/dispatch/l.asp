<img src="images/dispatch.gif"><br>
<br>
<%
if(GetSession("PHONEADMIN")!="0") {
%>
[ <a href="l.asp?P=dispatch&SP=add">輸入資料</a> ]
[ <a href="l.asp?P=dispatch&SP=print">再派列印</a> ]
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

