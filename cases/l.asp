<%
if(admin=="2" || admin=="5") {
%>
<b>�Ю׺޲z</b><br>
<br>
<%   if(company_id=='0') { %>
<a class="linkbut" href="l.asp?P=cases&SP=add">�W�[�Ю�</A>
<%	} %>
<a class="linkbut" href="l.asp?P=cases">�H��д����ƦC</a>
<a class="linkbut" href="l.asp?P=cases&SP=open">�H�}�Ф���ƦC</a>
<a class="linkbut" href="l.asp?P=cases&SP=opendet">�H�o�Ф���ƦC</a>

<br>
<BR>
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
      case "open" :
        %><!--#include file="copen.asp" --><%
      	break;
      case "opendet" :
        %><!--#include file="copendet.asp" --><%
      	break;
      default:
%>
<BR>
This page can not be found<BR>
<BR>
<%
	} // switch
	} // admin == 2,5
%>
&nbsp;
