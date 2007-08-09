<img src="images/visits.gif"><br>
<br>
<%if(admin!="0" && admin!="4") {%>

[ <a href="l.asp?P=visits&SP=add2">¿é¤J¸ê®Æ</a> ]
[ <a href="l.asp">·j´M</a> ]
<br>
<br>
<%}%>
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
      case "add2" :
       	 %><!--#include file="cadd2.asp" --><%
         break;
      case "editr" :
       	 %><!--#include file="ceditr.asp" --><%
         break;
      case "search" :
       	 %><!--#include file="csearch.asp" --><%
         break;
      case "result" :
       	 %><!--#include file="editr/l.asp" --><%
         break;
      case "cust" :
       	 %><!--#include file="editcust/l.asp" --><%
         break;
      case "complain" :
       	 %><!--#include file="complain/l.asp" --><%
         break;
      case "edit" :
       	 %><!--#include file="cedit.asp" --><%
         break;
      case "editmemo" :
       	 %><!--#include file="ceditmemo.asp" --><%
         break;
      case "addfromrecords" :
       	 %><!--#include file="caddfromrecords.asp" --><%
         break;
      default:
%>
This page can not be found ( <B><%=sp%></B>)<br>
<%
	}
%>

