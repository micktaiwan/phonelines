<%
var team = und(GetSession("custTEAM"));
var date   = und(GetSession("custDATE"));

   var result = String(Request("R"));
%>

<b>客戶資料鍵</b><br>
<br>
<form name="addform" action="visits/editcust/edit.asp" method="post">
<table border="0" cellspacing="0" cellpadding="4">
<tr><td>班別: </td><td><input type="text" name="team" value="<%=team%>" class="a90" style="height:14pt"></td></tr>
<tr><td>日期: </td><td><input type="text" name="date" value="<%=date%>" class="a90" style="height:14pt"> [ <a href="#" onclick="addform.date.value = MyNow(0);">今天</a> ]</td></tr>
<tr><td>電話號碼: </td><td><input type="text" name="phone" value="" class="a90" style="height:14pt"></td></tr>
<tr><td>客戶名稱: </td><td><input type="text" name="custname" value="" class="a90" style="height:14pt"></td></tr>
<tr><td>地址: </td><td><input type="text" name="custaddress" value="" class="a90" style="height:14pt"></td></tr>
<tr><td>聯絡人: </td><td><input type="text" name="contactname" value="" class="a90" style="height:14pt"></td></tr>
<tr><td>聯絡電話: </td><td><input type="text" name="contactphone" value="" class="a90" style="height:14pt"></td></tr>
<tr><td>&nbsp;</td><td><input class="button" type="submit" value=" 編　輯 " class="a90" style="height:14pt"></td></tr>
</table>
<input type="hidden" name="result" value="<%=result%>">
</form>
<%
   var e = String(Request("E"));
   if(e=="1") {
%>
      <strong>OK</strong><br>
      <br>
<%
      }
%>



<%
    switch(sp2.toLowerCase()) {
      case "" :
      case "undefined" :
      case "welcome" :
       	 %><!-- include file="ctree.asp" --><%
         break;
      default:
%>
This page can not be found ( <B><%=sp2%></B>)<br>
<%
	}
%>	

