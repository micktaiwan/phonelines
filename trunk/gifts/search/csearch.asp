<script src="gifts/search/search.js" type="text/javascript"></script>
<% if(admin!="4") { %>
<div id="header2">
  <ul>
    <li<%if(sp2=="undefined"){%> id="current"<%}%>><a href="l.asp?P=gifts&SP=search"><%=name%>查詢</a></li>
    <li<%if(sp2=="daily"){%> id="current"<%}%>><a href="l.asp?P=gifts&SP=search&SP2=daily">日報表</a></li>
    <li<%if(sp2=="total"){%> id="current"<%}%>><a href="l.asp?P=gifts&SP=search&SP2=total">總表/班總表</a></li>
    <li<%if(sp2=="list"){%> id="current"<%}%>><a href="l.asp?P=gifts&SP=search&SP2=list">清單</a></li>
    <li<%if(sp2=="del"){%> id="current"<%}%>><a href="l.asp?P=gifts&SP=search&SP2=del">刪除</a></li>
  </ul>
</div>
<br>
<br>
<br>
<% } %>
<%
    switch(sp2.toLowerCase()) {
      case "" :
      case "undefined" :
       	 %><!--#include file="s/cnormal.asp" --><%
         break;
      case "daily" :
       	 %><!--#include file="s/cdaily.asp" --><%
         break;
      case "total" :
       	 %><!--#include file="s/ctotal.asp" --><%
         break;
      case "list" :
       	 %><!--#include file="s/clist.asp" --><%
         break;
      case "del" :
       	 %><!--#include file="s/cdel.asp" --><%
         break;
      default:
%>
This page can not be found ( <B><%=sp%></B>)<br>
<%
	}
%>
