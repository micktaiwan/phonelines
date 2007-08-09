Too many records, I shut down this page....<br>
Mickael.<br>
<!--
[<a href="l.asp?P=pageviews">Last</a>]
[<a href="l.asp?P=pageviews&SP=guests">Guests</a>]
[<a href="l.asp?P=pageviews&SP=stats">Page Stats</a>]
<br>
<br>
-->
<%
    switch(sp.toLowerCase()) {
      case "" :
      case "undefined" :
      case "welcome" :
       	 %><!-- include file="ctree.asp" --><%
         break;
      case "guests" :
       	 %><!-- include file="cguests.asp" --><%
         break;
      case "ip" :
       	 %><!-- include file="cip.asp" --><%
         break;
      case "page" :
       	 %><!-- include file="cpage.asp" --><%
         break;
      case "stats" :
       	 %><!-- include file="cstats.asp" --><%
         break;
      case "name" :
       	 %><!-- include file="cname.asp" --><%
         break;
      default:
%>
This page can not be found ( <B><%=sp%></B>)<br>
<%
	}
%>
