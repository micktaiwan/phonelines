<%
    switch(p.toLowerCase()) {
      case "" :
      case "undefined" :
      case "welcome" :
       	 %><!--#include file="cwelcome.asp" --><%
         break;
      case "epi" :
       	 %><!--#include file="reporters/cedit_personal_infos.asp" --><%
         break;
      case "visits" :
       	 %><!--#include file="visits/l.asp" --><%
         break;
      case "zones" :
       	 %><!--#include file="zones/l.asp" --><%
         break;
      case "cancel" :
       	 %><!--#include file="cancel/l.asp" --><%
         break;
      case "dispatch" :
       	 %><!--#include file="dispatch/l.asp" --><%
         break;
      case "repair" :
       	 %><!--#include file="repair/l.asp" --><%
         break;
      case "problem" :
       	 %><!--#include file="problem/l.asp" --><%
         break;
      case "kproblem" :
       	 %><!--#include file="kproblem/l.asp" --><%
         break;
      case "time" :
       	 %><!--#include file="time/l.asp" --><%
         break;
      case "staff" :
       	 %><!--#include file="staff/l.asp" --><%
         break;
      case "reporters" :
       	 %><!--#include file="reporters/l.asp" --><%
         break;
      case "repairlog" :
       	 %><!--#include file="repairlog/l.asp" --><%
         break;
      case "personnel" :
       	 %><!--#include file="personnel/l.asp" --><%
         break;
      case "complains" :
       	 %><!--#include file="complains/l.asp" --><%
         break;
      case "search" :
       	 %><!--#include file="search/l.asp" --><%
         break;
      case "messages" :
       	 %><!--#include file="messages/l.asp" --><%
         break;
      case "cases" :
       	 %><!--#include file="cases/l.asp" --><%
         break;
      case "print" :
       	 %><!--#include file="print/l.asp" --><%
         break;
      case "pageviews" :
       	 %><!--#include file="pageviews/l.asp" --><%
         break;
      case "sms" :
       	 %><!--#include file="sms/l.asp" --><%
         break;
      case "formatsms" :
       	 %><!--#include file="sms/cformatsms.asp" --><%
         break;
      case "adv" :
       	 %><!--#include file="adv/l.asp" --><%
         break;
      case "information" :
       	 %><!--#include file="info/l.asp" --><%
         break;
      case "contacts" :
       	 %><!--#include file="contacts/l.asp" --><%
         break;
      case "visitsb" :
       	 %><!--#include file="visitsb/l.asp" --><%
         break;
      case "ranks" :
       	 %><!--#include file="ranks/l.asp" --><%
         break;
      case "dbedit" :
       	 %><!--#include file="dbedit/index.html" --><%
         break;
      case "gifts" :
       	 %><!--#include file="gifts/l.asp" --><%
         break;
      case "cal" :
       	 %><!--#include file="Calendar/l.asp" --><%
         break;			
      default:
%>
This page can not be found ( <B><%=p%></B>)<br>
<%
	}
%>
