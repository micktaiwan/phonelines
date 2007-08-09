<!--#include file="ccommonmenu2.asp"-->
<table BORDER=0 CELLSPACING=0 CELLPADDING=0 WIDTH="100%">
<%
if(admin=="1" || admin =="2" || admin=="3" || admin=="5") {
   if(company_id==0) {
%>

<tr>
<td HEIGHT="21" BGCOLOR="#103863" class="A"><img SRC="images/arrow01.gif"><a href="l.asp?P=DBEdit"><font color="white">DBEdit</font></a>&nbsp;&nbsp;<font color="#FF5555">0.14</font> <font color="#AAAAFF"></font></td>
</tr>

<tr>
<td><img SRC="images/line01.gif"></td>
</tr>

<tr>
<td HEIGHT="21" BGCOLOR="#103863" class="A"><img SRC="images/arrow01.gif"><a href="l.asp?P=DBEdit"><font color="white">Phones</font></a>&nbsp;&nbsp;<font color="#FF5555">0.12</font> <font color="#AAAAFF"></font></td>
</tr>

<tr>
<td><img SRC="images/line01.gif"></td>
</tr>
<%
      }
%>      
<tr>
<td HEIGHT="21" BGCOLOR="#103863" class="A"><img SRC="images/arrow01.gif" ><a href="l.asp?P=personnel"><font color="#FFCC00">職員資料</font></a></td>
</tr>

<tr>
<td><img SRC="images/line01.gif"></td>
</tr>

<%
   }
%>


<%
   if(company_id=='0') {
%>

<tr>
<td HEIGHT="21" BGCOLOR="#103863" class="A"><a href="javascript:ShowHide('printmenu')"><img src="images/arrow01.gif" border="0"><font color="#FFCC00">列印</font></a></td>
</tr>

<tr>
<td><img SRC="images/line01.gif"></td>
</tr>

</table>

<div id="printmenu" style="DISPLAY: none; Z-INDEX: 2">
<table BORDER=0 CELLSPACING=0 CELLPADDING=0 WIDTH="100%">
<tr>
<td HEIGHT="21" BGCOLOR="#B5C7DE" class="A"><img SRC="images/arrow01.gif" ><a href="l.asp?P=print&SP=cancel"><font color="#103863">退件列印</font></a></td>
</tr>

<tr>
<td><img SRC="images/line02.gif"></td>
</tr>

<tr>
<td HEIGHT="21" BGCOLOR="#B5C7DE" class="A"><img SRC="images/arrow01.gif" ><a href="l.asp?P=print&SP=dispatch"><font color="#103863">再派列印</font></a></td>
</tr>

<tr>
<td><img SRC="images/line02.gif"></td>
</tr>

<tr>
<td HEIGHT="21" BGCOLOR="#B5C7DE" class="A"><img SRC="images/arrow01.gif" ><a href="l.asp?P=print&SP=all"><font color="#103863">派工列印</font></a></td>
</tr>

<tr>
<td><img SRC="images/line02.gif"></td>
</tr>

<tr>
<td HEIGHT="21" BGCOLOR="#B5C7DE" class="A"><img SRC="images/arrow01.gif" ><a href="l.asp?P=print&SP=completed"><font color="#103863">竣工列印</font></a></td>
</tr>

<tr>
<td><img SRC="images/line02.gif"></td>
</tr>

<tr>
<td HEIGHT="21" BGCOLOR="#B5C7DE" class="A"><img SRC="images/arrow01.gif" ><a href="l.asp?P=print&SP=sep"><font color="#103863">隔日列印</font></a></td>
</tr>

<tr>
<td><img SRC="images/line02.gif"></td>
</tr>

<tr>
<td HEIGHT="21" BGCOLOR="#B5C7DE" class="A"><img SRC="images/arrow01.gif" ><a href="l.asp?P=print&SP=apart"><font color="#103863">拆線列印</font></a></td>
</tr>

<tr>
<td><img SRC="images/line02.gif"></td>
</tr>

<%
if(admin=="1" || admin =="2" || admin=="3" || admin=="5") {
%>
<tr>
<td HEIGHT="21" BGCOLOR="#B5C7DE" class="A"><img SRC="images/arrow01.gif" ><a target="_blank" href="repairlog/cprint.asp"><font color="#103863">障礙列印</font></a></td>
</tr>

<tr>
<td BGCOLOR="#103863"><img SRC="images/line02.gif"><br><br></td>
</tr>
<%
}
%>
</table>
</div>
<%
   }
%>


<%
if(admin=="1" || admin =="2" || admin=="3" || admin=="5") {
%>
<table BORDER=0 CELLSPACING=0 CELLPADDING=0 WIDTH="100%" >
<tr>
<td HEIGHT="21" BGCOLOR="#103863" class="A"><img SRC="images/arrow01.gif" ><a href="l.asp?P=visits"><font color="#FFFFFF">聯單鍵檔</font></a></td>
</tr>

<tr>
<td><img SRC="images/line01.gif"></td>
</tr>

<%
   if(company_id=='0') {
%>

<tr>
<td HEIGHT="21" BGCOLOR="#103863" class="A"><img SRC="images/arrow01.gif" ><a href="l.asp?P=visitsb"><font color="#FFFFFF">升速鍵檔</font></a></td>
</tr>

<tr>
<td><img SRC="images/line01.gif"></td>
</tr>
<%}%>

</table>
<%}%>


<%
if(admin=="1" || admin =="2" || admin=="3" || admin=="5") {
%>



<table BORDER=0 CELLSPACING=0 CELLPADDING=0 WIDTH="100%" >

<tr>
<td HEIGHT="21" BGCOLOR="#103863" class="A"><img SRC="images/arrow01.gif" ><a href="l.asp?P=repairlog"><font color="#FFFFFF">障礙管理</font></a></td>
</tr>

<tr>
<td><img SRC="images/line01.gif"></td>
</tr>

<%
if(admin=="2" || admin=="5") {
%>
<tr>
<td HEIGHT="21" BGCOLOR="#103863" class="A"><img SRC="images/arrow01.gif" ><a href="l.asp?P=cases"><font color="#FFFFFF">標案管理</font></a></td>
</tr>

<tr>
<td><img SRC="images/line01.gif"></td>
</tr>

<%
   if(company_id=='0') {
%>

<tr>
<td HEIGHT="21" BGCOLOR="#103863" class="A"><img SRC="images/arrow01.gif" ><a href="l.asp?P=pageviews"><font color="#FFFFFF">網頁參觀記錄</font></a></td>
</tr>

<tr>
<td><img SRC="images/line01.gif"></td>
</tr>

<tr>
<td HEIGHT="21" BGCOLOR="#103863" class="A"><img SRC="images/arrow01.gif" ><a href="l.asp?P=adv"><font color="#FFFFFF">廣告管理</font></a></td>
</tr>
<!--
<tr>
<td><img SRC="images/line01.gif"></td>
</tr>

<tr>
<td HEIGHT="21" BGCOLOR="#103863" class="A"><img SRC="images/arrow01.gif" ><a href="l.asp?P=ranks"><font color="#FFFFFF">班別排名</font></a></td>
</tr>
-->
<%
   } // company_id == 0
%>


<%
   } // admin = 2,5
%>

<tr>
<td HEIGHT="7" BGCOLOR="#103863" class="a90">&nbsp;<!--- Space ---></td>
</tr>

<tr>
<td HEIGHT="21" BGCOLOR="#103863" class="A"><a href="javascript:ShowHide('searchmenu')"><img src="images/arrow01.gif" border="0"><font color="#FFCC00">查詢</font></a></td>
</tr>
</table>

<div id="searchmenu" style="DISPLAY: none; Z-INDEX: 2">
<table BORDER=0 CELLSPACING=0 CELLPADDING=0 WIDTH="100%" >

<%
   if(company_id!=1) {
%>

<tr>
<td HEIGHT="21" BGCOLOR="#B5C7DE" class="A"><img SRC="images/arrow02.gif" ><a href="l.asp?P=search&SP=stats"><font color="#103863">Stats</font></a></td>
</tr>

<tr>
<td><img SRC="images/line02.gif"></td>
</tr>

<%
  }
%>

<tr>
<td HEIGHT="21" BGCOLOR="#B5C7DE" class="A"><img SRC="images/arrow02.gif" ><a href="l.asp?P=search&SP=8"><font color="#103863">查詢問題號碼</font></a></td>
</tr>

<tr>
<td><img SRC="images/line02.gif"></td>
</tr>
<tr>
<td HEIGHT="21" BGCOLOR="#B5C7DE" class="A"><img SRC="images/arrow02.gif" ><a href="l.asp?P=search&SP=1"><font color="#103863">查詢班派工狀況</font></a></td>
</tr>

<tr>
<td><img SRC="images/line02.gif"></td>
</tr>

<tr>
<td HEIGHT="21" BGCOLOR="#B5C7DE" class="A"><img SRC="images/arrow02.gif" ><a href="l.asp?P=search&SP=10"><font color="#103863">班派工統計表</font></a></td>
</tr>

<tr>
<td><img SRC="images/line02.gif"></td>
</tr>

<tr>
<td HEIGHT="21" BGCOLOR="#B5C7DE" class="A"><img SRC="images/arrow02.gif" ><a href="l.asp?P=search&SP=2"><font color="#103863">查詢派工單</font></a></td>
</tr>

<tr>
<td><img SRC="images/line02.gif"></td>
</tr>

<tr>
<td HEIGHT="21" BGCOLOR="#B5C7DE" class="A"><img SRC="images/arrow02.gif" ><a href="l.asp?P=search&SP=3"><font color="#103863">查詢班障礙</font></a></td>
</tr>

<tr>
<td><img SRC="images/line02.gif"></td>
</tr>

<tr>
<td HEIGHT="21" BGCOLOR="#B5C7DE" class="A"><img SRC="images/arrow02.gif" ><a href="l.asp?P=search&SP=4"><font color="#103863">查詢退件</font></a></td>
</tr>

<tr>
<td><img SRC="images/line02.gif"></td>
</tr>

<tr>
<td HEIGHT="21" BGCOLOR="#B5C7DE" class="A"><img SRC="images/arrow02.gif" ><a href="l.asp?P=search&SP=5"><font color="#103863">查詢再派</font></a></td>
</tr>

<tr>
<td><img SRC="images/line02.gif"></td>
</tr>

<tr>
<td HEIGHT="21" BGCOLOR="#B5C7DE" class="A"><img SRC="images/arrow02.gif" ><a href="l.asp?P=search&SP=9"><font color="#103863">查詢隔日</font></a></td>
</tr>


<tr>
<td><img SRC="images/line02.gif"></td>
</tr>

<tr>
<td HEIGHT="21" BGCOLOR="#B5C7DE" class="A"><img SRC="images/arrow02.gif" ><a href="l.asp?P=search&SP=6"><font color="#103863">查詢竣工</font></a></td>
</tr>

<tr>
<td><img SRC="images/line02.gif"></td>
</tr>

<tr>
<td HEIGHT="21" BGCOLOR="#B5C7DE" class="A"><img SRC="images/arrow02.gif" ><a href="l.asp?P=search&SP=7"><font color="#103863">查詢結果不明</font></a></td>
</tr>

<tr>
<td><img SRC="images/line02.gif"></td>
</tr>

<tr>
<td HEIGHT="21" BGCOLOR="#B5C7DE" class="A"><img SRC="images/arrow02.gif" ><a href="l.asp?P=gifts&SP=search"><font color="#103863">查詢贈品</font></a></td>
</tr>

</table>
</div>


<table BORDER=0 CELLSPACING=0 CELLPADDING=0 WIDTH="100%" >
<tr>
<td HEIGHT="21" BGCOLOR="#103863" class="A"><a href="javascript:ShowHide('keyinmenu')"><img src="images/arrow01.gif" border="0"><font color="#FFCC00">鍵檔</font></a></td>
</tr>
</table>


<div id="keyinmenu" style="DISPLAY: none; Z-INDEX: 2">
<table BORDER=0 CELLSPACING=0 CELLPADDING=0 WIDTH="100%" >
<tr>
<td HEIGHT="21" class="A"><img SRC="images/arrow02.gif" ><a href="l.asp?P=visits&SP=cust"><font color="#103863">客戶資料鍵檔</font></a></td>
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
<%
   if(company_id!=1) {
%>

<tr>
<td HEIGHT="21" class="A"><img SRC="images/arrow02.gif" ><a href="l.asp?P=gifts&SP=give"><font color="#103863">贈品鍵檔</font></a></td>
</tr>

<tr>
<td><img SRC="images/line03.gif"></td>
</tr>
<%
   }
%>


<tr>
<td HEIGHT="21" class="A"><img SRC="images/arrow02.gif" ><a href="l.asp?P=visits&SP=result&R=拆線"><font color="#103863">拆線鍵檔</font></a></td>
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
<td HEIGHT="21" class="A"><img SRC="images/arrow02.gif" ><a href="l.asp?P=visits&SP=result&R=退件"><font color="#103863">退件鍵檔</font></a></td>
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
<td HEIGHT="21" class="A"><img SRC="images/arrow02.gif" ><a href="l.asp?P=visits&SP=result&R=註銷"><font color="#103863">註銷鍵檔</font></a></td>
</tr>

<tr>
<td><img SRC="images/line03.gif"></td>
</tr>

<tr>
<td HEIGHT="21" class="A"><img SRC="images/arrow02.gif" ><a href="l.asp?P=visits&SP=result&R=修復"><font color="#103863">修復鍵檔</font></a></td>
</tr>

<tr>
<td HEIGHT="14" class="a90">&nbsp;<!--- Space ---></td>
</tr>
</table>
</div>
<%
if(admin=="5") {
%>

<table BORDER=0 CELLSPACING=0 CELLPADDING=0 WIDTH="100%" >
<tr>
<td HEIGHT="21" BGCOLOR="#103863" class="A"><a href="javascript:ShowHide('codemenu')"><img src="images/arrow01.gif" border="0"><font color="#FFCC00">代碼</font></a></td>
</tr>
</table>

<div id="codemenu" style="DISPLAY: none; Z-INDEX: 2">
<table BORDER=0 CELLSPACING=0 CELLPADDING=0 WIDTH="100%" >
<tr>
<td HEIGHT="21" class="A"><img SRC="images/arrow02.gif" ><a href="l.asp?P=zones"><font color="#103863">地區代碼</font></a></td>
</tr>

<tr>
<td><img SRC="images/line03.gif"></td>
</tr>

<tr>
<td HEIGHT="21" class="A"><img SRC="images/arrow02.gif" ><a href="l.asp?P=cancel"><font color="#103863">退件代碼</font></a></td>
</tr>

<tr>
<td><img SRC="images/line03.gif"></td>
</tr>

<tr>
<td HEIGHT="21" class="A"><img SRC="images/arrow02.gif" ><a href="l.asp?P=dispatch"><font color="#103863">再派代碼</font></a></td>
</tr>

<tr>
<td><img SRC="images/line03.gif"></td>
</tr>

<tr>
<td HEIGHT="21" class="A"><img SRC="images/arrow02.gif" ><a href="l.asp?P=problem"><font color="#103863">障礙代碼</font></a></td>
</tr>

<tr>
<td><img SRC="images/line03.gif"></td>
</tr>

<tr>
<td HEIGHT="21" class="A"><img SRC="images/arrow02.gif" ><a href="l.asp?P=kproblem"><font color="#103863">問題案代碼</font></a></td>
</tr>

<tr>
<td><img SRC="images/line03.gif"></td>
</tr>

<tr>
<td HEIGHT="21" class="A"><img SRC="images/arrow02.gif" ><a href="l.asp?P=repair"><font color="#103863">修復代碼</font></a></td>
</tr>

<tr>
<td><img SRC="images/line03.gif"></td>
</tr>

<tr>
<td HEIGHT="21" class="A"><img SRC="images/arrow02.gif" ><a href="l.asp?P=time"><font color="#103863">時段代碼</font></a></td>
</tr>

<tr>
<td><img SRC="images/line03.gif"></td>
</tr>

<tr>
<td HEIGHT="21" class="A"><img SRC="images/arrow02.gif" ><a href="l.asp?P=gifts"><font color="#103863">贈品代碼</font></a></td>
</tr>

<!--
<tr>
<td><img SRC="images/line03.gif"></td>
</tr>

<tr>
<td HEIGHT="21" class="A"><img SRC="images/arrow02.gif" ><a href="l.asp?P=staff"><font color="#103863">輸入員代碼</font></a></td>
</tr>
-->

<tr>
<td><img SRC="images/line03.gif"></td>
</tr>

<tr>
<td HEIGHT="21" class="A"><img SRC="images/arrow02.gif" ><a href="l.asp?P=reporters"><font color="#103863">通報單位代碼</font></a></td>
</tr>
</table>
</div>
<%}%>
<%}%>
