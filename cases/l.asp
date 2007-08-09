<%
if(admin=="2" || admin=="5") {
%>
<b>標案管理</b><br>
<br>
<%   if(company_id=='0') { %>
<a class="linkbut" href="l.asp?P=cases&SP=add">增加標案</A>
<%	} %>
<a class="linkbut" href="l.asp?P=cases">以投標期限排列</a>
<a class="linkbut" href="l.asp?P=cases&SP=open">以開標日期排列</a>
<a class="linkbut" href="l.asp?P=cases&SP=opendet">以得標日期排列</a>

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
