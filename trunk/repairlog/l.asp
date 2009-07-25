<img src="images/repairlog.gif"><br>
<br>
<% if (admin!="4") { %>

[ <a href="l.asp?P=repairlog">障礙首頁</a> ]
<% if (admin!="3") { %>
[ <a href="l.asp?P=repairlog&SP=repaircount">障礙計算</a> ]
[ <a href="l.asp?P=repairlog&SP=reportstats">統計總表</a> ]
<%}%>

<% if (admin!="3") { %>
<b>簡訊</b>:
<%}%>
[ <a href="l.asp?P=repairlog&SP=sms">送簡訊</a> ]
[ <a href="l.asp?P=repairlog&SP=smslog">今天記錄</a> ]
[ <a href="l.asp?P=repairlog&SP=smslog&ALL">所有記錄</a> ]
<% if (admin!="3") { %>

<b>簡訊統計:</b>
[ <a href="l.asp?P=repairlog&SP=smscount">月分</a> ]
[ <a href="l.asp?P=repairlog&SP=smscount&SP2=all">所有簡訊統計</a> ]
[ <a href="l.asp?P=repairlog&SP=smscount&SP2=today">今天記錄</a> ]
<%}%>
<br>
<%}%>

<!--
[ <a href="l.asp?P=repairlog&SP=add">輸入資料</a> ]
[ <a href="l.asp?P=repairlog&SP=search">搜尋</a> ]
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

