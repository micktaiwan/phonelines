<a class="linkbut" href="l.asp?P=visitsb"><img src="images/point_06.gif" border="0"> List</a>
<%if(admin!="0" && admin!="4") {%>
<a class="linkbut" href="l.asp?P=visitsb&SP=add"><img src="images/point_06.gif" border="0"> ¿é¤J¸ê®Æ</a>
<%}%>
<a class="linkbut" href="l.asp?P=visitsb&SP=search"><img src="images/point_06.gif" border="0"> ·j´M</a>
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
      case "search" :
       	 %><!--#include file="csearch.asp" --><%
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

