<b>�d��</b>
<%
if(sp=="undefined") sp = "1"
%>
<div id="header">
  <ul>
<%
   if(company_id!=1) {
%>

    <li<%if(sp=="stats"){%> id="current"<%}%>><a href="l.asp?P=search&SP=stats">Stats</a></li>
<%
   }
   else {
   if(sp=="stats") sp = "8";
   }
%>
   
    <li<%if(sp=="8" || sp=="11" || sp=="12"){%> id="current"<%}%>><a href="l.asp?P=search&SP=8">���D</a></li>
    <li<%if(sp=="1"){%> id="current"<%}%>><a href="l.asp?P=search&SP=1">�Z���u���p</a></li>
    <li<%if(sp=="10"){%> id="current"<%}%>><a href="l.asp?P=search&SP=10">�Z���u�έp��</a></li>
    <li<%if(sp=="2"){%> id="current"<%}%>><a href="l.asp?P=search&SP=2">���u��</a></li>
    <li<%if(sp=="13"){%> id="current"<%}%>><a href="l.asp?P=search&SP=13">�̮ɺި�</a></li>
    <li<%if(sp=="3"){%> id="current"<%}%>><a href="l.asp?P=search&SP=3">�Z��ê</a></li>
    <li<%if(sp=="4"){%> id="current"<%}%>><a href="l.asp?P=search&SP=4">�h��</a></li>
    <li<%if(sp=="5"){%> id="current"<%}%>><a href="l.asp?P=search&SP=5">�A��</a></li>
    <li<%if(sp=="9"){%> id="current"<%}%>><a href="l.asp?P=search&SP=9">�j��</a></li>
    <li<%if(sp=="6"){%> id="current"<%}%>><a href="l.asp?P=search&SP=6">���u</a></li>
    <li<%if(sp=="7"){%> id="current"<%}%>><a href="l.asp?P=search&SP=7">���G����</a></li>
<%
   if(company_id!=1) {
%>
    <li<%if(sp=="search"){%> id="current"<%}%>><a href="l.asp?P=gifts&SP=search">�ث~</a></li>
<%
   }
%>
  </ul>
</div>
<br>
<br>
<br>
<br>
<br>
<%
switch(sp) {
   case "stats" : %><!--#include file="stats.asp"--><% break;
   case "11" : %><!--#include file="s11.asp"--><% break;
   case "12" : %><!--#include file="s12.asp"--><% break;
   case "13" : %><!--#include file="s13.asp"--><% break;
   case "10" : %><!--#include file="s10.asp"--><% break;
   case "3" : %><!--#include file="s3.asp"--><% break;
   case "8" : %><!--#include file="s8.asp"--><% break;
   default  :  %><!--#include file="def.asp"--><% break;
   }
%>