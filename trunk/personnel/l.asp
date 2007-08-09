<%
if(admin=="2" || admin=="5") {
%>
<img src="images/personnel.gif"><br>
<br>
<a class="linkbut" href="l.asp?P=personnel&SP=add">輸入資料</a>
<%
   if(company_id=='0') {
%>

<a class="linkbut" href="l.asp?P=personnel&SP=holidays">請假單</a>
<a class="linkbut" href="l.asp?P=personnel&SP=missions">外出單</a>
<%
   }
%>
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
      case "holidays" :
       	 %><!--#include file="holidays/l.asp" --><%
         break;
      case "missions" :
       	 %><!--#include file="missions/l.asp" --><%
         break;
      default:
%>
This page can not be found ( <B><%=sp%></B>)<br>
<%
	}
%>

<%
	}
	else {
%>
<br>
<br>
<br>
<br>
<center>
No permission
</center>
<%
	}
%>
