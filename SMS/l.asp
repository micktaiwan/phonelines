<%
if(admin!="3") {
if(GetSession("PHONETOTALSMS")=="undefined") Response.Write("Please log out and log in again");
else {
   smsleft = GetSession("PHONESMSLEFT");
%>
<!--
<div class="logbox">
<img src="images/bul1.gif"> <b>����: �۶O�� (�S���s�i)</b><br>
<ul>
<strong><%=smsleft%></strong> �ѤU����..<br>
</ul>
<br>
<img src="images/bul1.gif"> <b>����: �K�O��</b><br>
<ul>
<%
   //var smshnid = GetSession("PHONESMSHNID");
   // get how many SMS he send in the last 24h
   //obj.ClearAll();
   //obj.NewQuery("SELECT COUNT(*) AS ID FROM SMS WHERE MEMBERID='"+id+"' AND TYPE=1 AND RESULT=0 AND TRACKING!=21 AND TRACKING!=13 AND SENTDATE>GETDATE()-1");
   //obj.NewTemplate(MMSitePath+"id.wet");
   //var last24 = obj.GenerateString(0,0)*1;
%>
<% //Response.Write("<strong>"+last24 + "</strong> " + "�Ӷǰe��SMS (�b�̪�24�p�ɤ�)");%><br>
<% //if (smshnid=="10") Response.Write("�L���")%>
<% //else Response.Write("<strong>"+(5-last24) + "</strong> " + "�ѤU����");%><br>
</ul>
</div>
-->

<br>
<%
   switch(sp.toLowerCase()) {
      case "undefined" :
      case "welcome" :
        %><!--#include file="ctree.asp" --><%
      	break;
      case "send" :
        %><!--#include file="csend.asp" --><%
      	break;
      default:
%>
<BR>
This page can not be found<BR>
<BR>
<%
	}
	}
	} // admin == 2
%>
