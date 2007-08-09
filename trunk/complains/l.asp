<img src="images/visits.gif"><br>
<br>
<%if(GetSession("PHONEADMIN")!="0") {%>
[ <a href="l.asp?P=visits&SP=add">¿é¤J¸ê®Æ</a> ]
[ <a href="l.asp?P=visits&SP=search">·j´M</a> ]
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
      default:
%>
This page can not be found ( <B><%=sp%></B>)<br>
<%
	}
%>	

