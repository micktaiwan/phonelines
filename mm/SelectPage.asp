<%
if(bad) {
%>
Welcome to the <b>Organizer's Content Manager Center</b><br>
<br>
<FORM ACTION="l.asp?<%=Request.ServerVariables("QUERY_STRING")%>" METHOD=POST>
<table BORDER=0 CELLSPACING=0 CELLPADDING=3>
<tr><td>Password:</td><td><input type="password" name="Pass" size="15"></td></tr>
<tr><td>&nbsp;</td><td><input type="submit" value="Enter"></td></tr>
</table>
</FORM>
<%
   if(p!="undefined") Response.Write("Bad password.");
   }
else {
	if(Session("Pass")!= password) Session("Pass") = p
   }	   
if(!bad) {
   switch(Page.toLowerCase()) {
      case "undefined" :
      case "welcome" :
        %><!--#include file="Welcome.asp" --><%
      	break;
      case "pageviews" :
        %><!--#include file="pageviews/l.asp" --><%
      	break;
      default:
%>
<BR>
This page can not be found (<B><%=Page%></B>)<BR>
<BR>
<%
	}
}
%>	
