<%
if(canseebom) {

    switch(p.toLowerCase()) {
      case "" :
      case "undefined" :
      case "welcome" :
       	 %><!--#include file="cwelcome.asp" --><%
         break;
      case "wdata" :
       	 %><!--#include file="work/data/l.asp" --><%
         break;
      case "ascode" :
       	 %><!--#include file="work/ascode/l.asp" --><%
         break;
      case "items" :
       	 %><!--#include file="work/items/l.asp" --><%
         break;
      case "mdata" :
       	 %><!--#include file="material/data/l.asp" --><%
         break;
      case "request" :
       	 %><!--#include file="material/request/l.asp" --><%
         break;
      case "teammat" :
       	 %><!--#include file="material/team/l.asp" --><%
         break;
      case "jdata" :
       	 %><!--#include file="job/data/l.asp" --><%
         break;
      case "team" :
       	 %><!--#include file="job/team/l.asp" --><%
         break;
      case "teamjob" :
       	 %><!--#include file="job/teamjob/l.asp" --><%
         break;
      case "admin" :
       	 %><!--#include file="job/admin/l.asp" --><%
         break;
      case "search" :
       	 %><!--#include file="search/l.asp" --><%
         break;
      default:
%>
This page can not be found ( <B><%=p%></B>)<br>
<%
	} // switch
   } // canseebom
%>
