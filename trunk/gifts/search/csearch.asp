<script src="gifts/search/search.js" type="text/javascript"></script>
<% if(admin!="4") { %>
<div id="header2">
  <ul>
    <li<%if(sp2=="undefined"){%> id="current"<%}%>><a href="l.asp?P=gifts&SP=search"><%=name%>�d��</a></li>
    <li<%if(sp2=="daily"){%> id="current"<%}%>><a href="l.asp?P=gifts&SP=search&SP2=daily">�����</a></li>
    <li<%if(sp2=="total"){%> id="current"<%}%>><a href="l.asp?P=gifts&SP=search&SP2=total">�`��/�Z�`��</a></li>
    <li<%if(sp2=="list"){%> id="current"<%}%>><a href="l.asp?P=gifts&SP=search&SP2=list">�M��</a></li>
    <li<%if(sp2=="del"){%> id="current"<%}%>><a href="l.asp?P=gifts&SP=search&SP2=del">�R��</a></li>
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
