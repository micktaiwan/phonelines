<!--#include file="get_vars.asp"-->
<!--<img src="images/gifts.gif"><br>-->
<% if(sp=="undefined" || sp=="") sp = "welcome"; %>
<script src="gifts/js/gifts.js" type="text/javascript"></script>
<div id="header">
  <ul>
    <li<%if(sp=="welcome" && maintable=="gifts"){%> id="current"<%}%>><a href="gifts/set_vars_gifts.asp?P=gifts">�ث~�N�X</a></li>
    <li<%if(sp=="welcome" && maintable=="mat"){%> id="current"<%}%>><a href="gifts/set_vars_mat.asp?P=gifts">�]�ƥή�</a></li>
    <li class="spacer"></li>
    <li<%if(sp=="give" && maintable=="gifts"){%> id="current"<%}%>><a href="gifts/set_vars_gifts.asp?P=gifts&SP=give">�ث~����</a></li>
    <li class="spacer"></li>
    <li<%if(sp=="search" && maintable=="gifts"){%> id="current"<%}%>><a href="gifts/set_vars_gifts.asp?P=gifts&SP=search">�ث~�d��</a></li>
    <li<%if(sp=="search" && maintable=="mat"){%> id="current"<%}%>><a href="gifts/set_vars_mat.asp?P=gifts&SP=search">�]�Ƭd��</a></li>
    <!--<li<%if(sp=="give" && maintable=="mat"){%> id="current"<%}%>><a href="gifts/set_vars_mat.asp?P=gifts&SP=give">�]������</a></li>-->
  </ul>
</div>
<br>
<br>
<br>
<br>
<!--
maintable=<%=maintable%><br/>
sectable =<%=sectable%><br/>
<br/>
-->
<%
    switch(sp.toLowerCase()) {
      case "" :
      case "welcome" :
       	 %><!--#include file="codes/ctree.asp" --><%
         break;
      case "add" :
       	 %><!--#include file="codes/cadd.asp" --><%
         break;
      case "edit" :
       	 %><!--#include file="codes/cedit.asp" --><%
         break;
      case "give" :
       	 %><!--#include file="give/cgive.asp" --><%
         break;
      case "given" :
       	 %><!--#include file="give/cgiven.asp" --><%
         break;
      case "search" :
       	 %><!--#include file="search/csearch.asp" --><%
         break;
      default:
%>
This page can not be found ( <B><%=sp%></B>)<br>
<%
	}
%>
