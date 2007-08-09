<img src="images/cancel.gif"><br>
<br>
<%
if(GetSession("PHONEADMIN")!="0") {
%>
[ <a href="l.asp?P=cancel&SP=add">輸入資料</a> ]
[ <a href="l.asp?P=cancel&SP=print">退件列印</a> ]
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

