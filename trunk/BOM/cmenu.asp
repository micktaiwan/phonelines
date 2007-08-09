<!--- Menu --->
<table BORDER=0 CELLSPACING=0 CELLPADDING=0 WIDTH="100%" >
<tr>
<td><img SRC="images/bk_menu.gif"></td>
</tr>

<tr>
<td VALIGN=TOP HEIGHT="30" BGCOLOR="#103863" class="A">
<!--#include file="../ccommonmenu.asp"-->
</td>
</tr>


<tr>
<td HEIGHT="7" BGCOLOR="#103863" class="a90">&nbsp;<!--- Space ---></td>
</tr>
</table>

<% if(IsLogged("PHONE")) { %>

<!--#include file="../ccommonmenu2.asp"-->


<table BORDER=0 CELLSPACING=0 CELLPADDING=0 WIDTH="100%" >
<tr>
<td HEIGHT="21" BGCOLOR="#103863" class="A"><br><img SRC="images/arrow01.gif" ><a href="l.asp?bom=1"><font color="#FFCC00">工程管理</font></a></td>
</tr>

<tr>
<td><img SRC="images/line01.gif"></td>
</tr>

<tr>
<td HEIGHT="21" BGCOLOR="#103863" class="A"><img SRC="images/arrow01.gif" ><a href="l.asp?bom=1&P=wdata"><font color="#FFFFFF">工程基本資料建檔</font></a></td>
</tr>

<tr>
<td><img SRC="images/line01.gif"></td>
</tr>

<tr>
<td HEIGHT="21" BGCOLOR="#103863" class="A"><img SRC="images/arrow01.gif" ><a href="l.asp?bom=1&P=ascode"><font color="#FFFFFF">加減點代號</font></a></td>
</tr>

<tr>
<td><img SRC="images/line01.gif"></td>
</tr>

<tr>
<td HEIGHT="21" BGCOLOR="#103863" class="A"><img SRC="images/arrow01.gif" ><a href="l.asp?bom=1&P=items"><font color="#FFFFFF">積點表</font></a></td>
</tr>

<tr>
<td><img SRC="images/line01.gif"></td>
</tr>

<tr>
<td HEIGHT="21" BGCOLOR="#103863" class="A"><br><img SRC="images/arrow01.gif" ><a href="l.asp?bom=1"><font color="#FFCC00">材料管理</font></a></td>
</tr>

<tr>
<td><img SRC="images/line01.gif"></td>
</tr>

<tr>
<td HEIGHT="21" BGCOLOR="#103863" class="A"><img SRC="images/arrow01.gif" ><a href="l.asp?bom=1&P=mdata"><font color="#FFFFFF">材料鍵檔</font></a></td>
</tr>

<tr>
<td><img SRC="images/line01.gif"></td>
</tr>

<tr>
<td HEIGHT="21" BGCOLOR="#103863" class="A"><img SRC="images/arrow01.gif" ><a href="l.asp?bom=1&P=request"><font color="#FFFFFF">局領料管理</font></a></td>
</tr>

<tr>
<td><img SRC="images/line01.gif"></td>
</tr>

<tr>
<td HEIGHT="21" BGCOLOR="#103863" class="A"><img SRC="images/arrow01.gif" ><a href="l.asp?bom=1&P=teammat"><font color="#FFFFFF">班領料建檔</font></a></td>
</tr>

<tr>
<td><img SRC="images/line01.gif"></td>
</tr>

<tr>
<td HEIGHT="21" BGCOLOR="#103863" class="A"><br><img SRC="images/arrow01.gif" ><a href="l.asp?bom=1"><font color="#FFCC00">工作單管理</font></a></td>
</tr>

<tr>
<td><img SRC="images/line01.gif"></td>
</tr>
<!--
<tr>
<td HEIGHT="21" BGCOLOR="#103863" class="A"><img SRC="images/arrow01.gif" ><a href="l.asp?bom=1&P=jdata"><font color="#FFFFFF">工作單鍵檔</font></a></td>
</tr>

<tr>
<td><img SRC="images/line01.gif"></td>
</tr>

<tr>
<td HEIGHT="21" BGCOLOR="#103863" class="A"><img SRC="images/arrow01.gif" ><a href="l.asp?bom=1&P=team"><font color="#FFFFFF">工作單派班鍵檔</font></a></td>
</tr>

<tr>
<td><img SRC="images/line01.gif"></td>
</tr>

<tr>
<td HEIGHT="21" BGCOLOR="#103863" class="A"><img SRC="images/arrow01.gif" ><a href="l.asp?bom=1&P=teamjob"><font color="#FFFFFF">班工作項目及用料建檔</font></a></td>
</tr>

<tr>
<td><img SRC="images/line01.gif"></td>
</tr>

<tr>
<td HEIGHT="21" BGCOLOR="#103863" class="A"><img SRC="images/arrow01.gif" ><a href="l.asp?bom=1&P=admin"><font color="#FFFFFF">管理部工作單管制鍵檔</font></a></td>
</tr>

<tr>
<td><img SRC="images/line01.gif"></td>
</tr>
-->

<tr>
<td HEIGHT="21" BGCOLOR="#103863" class="A"><img SRC="images/arrow01.gif" ><a href="l.asp?bom=1&P=search"><font color="#FFFFFF">查詢工作單狀況</font></a></td>
</tr>

<tr>
<td><img SRC="images/line01.gif"></td>
</tr>

<tr>
<td HEIGHT="21" BGCOLOR="#103863" class="A"><img SRC="images/arrow01.gif" ><font color="#FFFFFF">Please use DBEdit</font></td>
</tr>

<% } %>

<tr>
<td HEIGHT="30" class="a90">&nbsp;<!--- Space ---></td>
</tr>
</table>
