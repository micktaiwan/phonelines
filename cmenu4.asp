<!--- Menu --->
<table BORDER=0 CELLSPACING=0 CELLPADDING=0 WIDTH="100%" >
<tr>
<td><img SRC="images/bk_menu.gif"></td>
</tr>

<tr>
<td VALIGN=TOP HEIGHT="30" BGCOLOR="#103863" class="A">
<!--#include file="ccommonmenu.asp"-->
</td>
</tr>


<tr>
<td HEIGHT="7" BGCOLOR="#103863" class="a90">&nbsp;<!--- Space ---></td>
</tr>
</table>
<%
if(IsLogged("PHONE")) {
%>
<!--#include file="ccommonmenu2.asp"-->

<table BORDER=0 CELLSPACING=0 CELLPADDING=0 WIDTH="100%" >
<tr>
<td HEIGHT="21" BGCOLOR="#103863" class="A"><img SRC="images/arrow01.gif" ><a href="l.asp?P=repairlog"><font color="#FFFFFF">障礙管理</font></a></td>
</tr>

<tr>
<td><img SRC="images/line01.gif"></td>
</tr>

<tr>
<td HEIGHT="21" BGCOLOR="#103863" class="A"><img SRC="images/arrow01.gif" ><a href="l.asp?P=formatsms"><font color="#FFFFFF">SMS</font></a></td>
</tr>

<tr>
<td HEIGHT="21" BGCOLOR="#B5C7DE" class="A"><img SRC="images/arrow02.gif" ><a href="l.asp?P=search&SP=1"><font color="#103863">查詢班派工狀況</font></a></td>
</tr>

<tr>
<td HEIGHT="21" class="A"><img SRC="images/arrow02.gif" ><a href="l.asp?P=visitsb"><font color="#103863">升速鍵檔</font></a></td>
</tr>

<tr>
<td><img SRC="images/line03.gif"></td>
</tr>

<tr>
<td HEIGHT="21" class="A"><img SRC="images/arrow02.gif" ><a href="l.asp?P=visits&SP=result&R=竣工"><font color="#103863">竣工鍵檔</font></a></td>
</tr>

<tr>
<td><img SRC="images/line03.gif"></td>
</tr>

<tr>
<td HEIGHT="21" class="A"><img SRC="images/arrow02.gif" ><a href="l.asp?P=visits&SP=result&R=退件"><font color="#103863">退件鍵檔</font></a></td>
</tr>

<tr>
<td><img SRC="images/line03.gif"></td>
</tr>

<tr>
<td HEIGHT="21" class="A"><img SRC="images/arrow02.gif" ><a href="l.asp?P=visits&SP=result&R=拆線"><font color="#103863">拆線鍵檔</font></a></td>
</tr>

<tr>
<td><img SRC="images/line03.gif"></td>
</tr>

<tr>
<td HEIGHT="21" class="A"><img SRC="images/arrow02.gif" ><a href="l.asp?P=visits&SP=result&R=再派"><font color="#103863">再派鍵檔</font></a></td>
</tr>

<tr>
<td><img SRC="images/line03.gif"></td>
</tr>

<tr>
<td HEIGHT="21" class="A"><img SRC="images/arrow02.gif" ><a href="l.asp?P=visits&SP=result&R=隔日"><font color="#103863">隔日鍵檔</font></a></td>
</tr>

<tr>
<td><img SRC="images/line03.gif"></td>
</tr>

<tr>
<td HEIGHT="21" class="A"><img SRC="images/arrow02.gif" ><a href="l.asp?P=gifts&SP=give"><font color="#103863">贈品鍵檔</font></a> / <a href="l.asp?P=gifts&SP=search"><font color="#103863">贈品查詢</font></a></td>
</tr>


<% } //logged %>

<tr>
<td HEIGHT="30" class="a90">&nbsp;<!--- Space ---></td>
</tr>
</table>
