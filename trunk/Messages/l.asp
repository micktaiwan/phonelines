<b>�H�������P�ǰe</b><br>
<br>
<%
   switch(sp.toLowerCase()) {
      case "undefined" :
      case "welcome" :
        %><!--#include file="ctree.asp" --><%
      	break;
      case "send" :
        %><!--#include file="csend.asp" --><%
      	break;
      default:
%>
<BR>
This page can not be found<BR>
<BR>
<%
	}
%>	
