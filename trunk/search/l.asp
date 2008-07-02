<b>查詢</b>
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
   
    <li<%if(sp=="8" || sp=="11" || sp=="12"){%> id="current"<%}%>><a href="l.asp?P=search&SP=8">問題</a></li>
    <li<%if(sp=="1"){%> id="current"<%}%>><a href="l.asp?P=search&SP=1">班派工狀況</a></li>
    <li<%if(sp=="10"){%> id="current"<%}%>><a href="l.asp?P=search&SP=10">班派工統計表</a></li>
    <li<%if(sp=="2"){%> id="current"<%}%>><a href="l.asp?P=search&SP=2">派工單</a></li>
    <li<%if(sp=="13"){%> id="current"<%}%>><a href="l.asp?P=search&SP=13">依時管制</a></li>
    <li<%if(sp=="3"){%> id="current"<%}%>><a href="l.asp?P=search&SP=3">班障礙</a></li>
    <li<%if(sp=="4"){%> id="current"<%}%>><a href="l.asp?P=search&SP=4">退件</a></li>
    <li<%if(sp=="5"){%> id="current"<%}%>><a href="l.asp?P=search&SP=5">再派</a></li>
    <li<%if(sp=="9"){%> id="current"<%}%>><a href="l.asp?P=search&SP=9">隔日</a></li>
    <li<%if(sp=="6"){%> id="current"<%}%>><a href="l.asp?P=search&SP=6">竣工</a></li>
    <li<%if(sp=="7"){%> id="current"<%}%>><a href="l.asp?P=search&SP=7">結果不明</a></li>
<%
   if(company_id!=1) {
%>
    <li<%if(sp=="search"){%> id="current"<%}%>><a href="l.asp?P=gifts&SP=search">贈品</a></li>
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