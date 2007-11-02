<table BORDER=0 CELLSPACING=0 CELLPADDING=0 WIDTH="100%">
<tr>
<td HEIGHT="21" BGCOLOR="#103863" class="A"><img SRC="images/arrow03.gif" ><a href="logout.asp">登出本系統</a></td>
</tr>

<tr>
<td><img SRC="images/line01.gif"></td>
</tr>

<tr>
<td HEIGHT="21" BGCOLOR="#103863" class="A"><img SRC="images/arrow04.gif" ><a href="l.asp"><font color="#FFCC00">回到首頁</font></a></td>
</tr>

<tr>
<td><img SRC="images/line01.gif"></td>
</tr>

<tr>
<td HEIGHT="21" BGCOLOR="#103863" class="A"><img SRC="images/arrow04.gif" ><a href="l.asp?P=epi"><font color="#FFCC00">更改個人密碼</font></a></td>
</tr>

<tr>
<td HEIGHT="21" BGCOLOR="#103863" class="A"><img SRC="images/arrow04.gif" ><a href="l.asp?P=cal"><font color="#FFCC00">行事曆</font></a></td>
</tr>

<tr>
<td><img SRC="images/line01.gif"></td>
</tr>

<% if(canseebom) { %>

<tr>
<td HEIGHT="21" BGCOLOR="#103863" class="A"><img SRC="images/arrow01.gif" ><a href="l.asp?bom=1"><font color="#FFFFFF">工程管理</font></a></td>
</tr>

<tr>
<td><img SRC="images/line01.gif"></td>
</tr>

<% } %>

<tr>
<td HEIGHT="21" BGCOLOR="#103863" class="A"><img SRC="images/arrow01.gif" ><a href="l.asp?P=information"><font color="#FFFFFF">公告欄</font></a></td>
</tr>

<tr>
<td><img SRC="images/line01.gif"></td>
</tr>

<tr>
<td HEIGHT="21" BGCOLOR="#103863" class="A"><img SRC="images/arrow01.gif" ><a href="l.asp?P=messages"><font color="#FFFFFF">信息傳送接收</font></a></td>
</tr>

<tr>
<td><img SRC="images/line01.gif"></td>
</tr>

<%
   if(company_id=='0') {
%>

<tr>
<td HEIGHT="21" BGCOLOR="#103863" class="A"><img SRC="images/arrow01.gif" ><a href="l.asp?P=contacts"><font color="#FFFFFF">通訊錄</font></a></td>
</tr>

<tr>
<td><img SRC="images/line01.gif"></td>
</tr>
<%
   }
%>

<% if (admin!="3" && admin!="4") { %>
<tr>
<td HEIGHT="21" BGCOLOR="#103863" class="A"><img SRC="images/arrow01.gif" ><a href="l.asp?P=sms"><font color="#FFFFFF">簡訊</font></a></td>
</tr>

<tr>
<td><img SRC="images/line01.gif"></td>
</tr>
<% } %>


</table>
