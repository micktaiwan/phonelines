<img src="images/repairlog.gif"><br>
<br>
<% if (admin!="4") { %>

[ <a href="l.asp?P=repairlog">��ê����</a> ]
<% if (admin!="3") { %>
[ <a href="l.asp?P=repairlog&SP=repaircount">��ê�p��</a> ]
[ <a href="l.asp?P=repairlog&SP=reportstats">�έp�`��</a> ]
<%}%>

<% if (admin!="3") { %>
<b>²�T</b>:
<%}%>
[ <a href="l.asp?P=repairlog&SP=sms">�e²�T</a> ]
[ <a href="l.asp?P=repairlog&SP=smslog">���ѰO��</a> ]
[ <a href="l.asp?P=repairlog&SP=smslog&ALL">�Ҧ��O��</a> ]
<% if (admin!="3") { %>

<b>²�T�έp:</b>
[ <a href="l.asp?P=repairlog&SP=smscount">���</a> ]
[ <a href="l.asp?P=repairlog&SP=smscount&SP2=all">�Ҧ�²�T�έp</a> ]
[ <a href="l.asp?P=repairlog&SP=smscount&SP2=today">���ѰO��</a> ]
<%}%>
<br>
<%}%>

<!--
[ <a href="l.asp?P=repairlog&SP=add">��J���</a> ]
[ <a href="l.asp?P=repairlog&SP=search">�j�M</a> ]
<br>
-->
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
      case "editr" :
       	 %><!--#include file="ceditr.asp" --><%
         break;
      case "edit" :
       	 %><!--#include file="cedit.asp" --><%
         break;
      case "search" :
       	 %><!--#include file="csearch.asp" --><%
         break;
      case "afv" :
       	 %><!--#include file="caddfromvisit.asp" --><%
         break;
      case "byv" :
       	 %><!--#include file="cbyvisit.asp" --><%
         break;
      case "sms" :
       	 %><!--#include file="csms.asp" --><%
         break;
      case "smslog" :
       	 %><!--#include file="smslog/ctree.asp" --><%
         break;
      case "smscount" :
       	 %><!--#include file="smscount/l.asp" --><%
         break;
      case "repaircount" :
       	 %><!--#include file="repaircount/ctree.asp" --><%
         break;
      case "reportstats" :
       	 %><!--#include file="creport_stats.asp" --><%
         break;
      default:
%>
This page can not be found ( <B><%=sp%></B>)<br>
<%
	}
%>

