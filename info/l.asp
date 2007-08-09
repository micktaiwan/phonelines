<%
if(admin=="2") {%>
   <a class="linkbut" href="<%=QS%>information&SP=add"><img src="images/point_06.gif" border="0"> ¼W¥[·s»D</a><br>
   <br><%
   }%>
<%
   switch(sp.toLowerCase()) {
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
      case "display" :
        %><!--#include file="cdisplay.asp" --><%
      	break;
      default:
%>
<BR>
This page can not be found<BR>
<BR>
<%
	}
%>
