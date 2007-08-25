<%@ language="javascript"%>
<!--#include file="../../virtual.asp"-->
<!--#include file="../../func.asp" -->
<%
   var date = String(Request("D"));
   var team = String(Request("T"));
   var phone = String(Request("P"));
   var obj = Server.CreateObject("MATech.Engine");
   obj.SetDB(DB,"sa","engine");

   var rv = "<table id=\"gifttable\" cellspacing=1 cellpadding=2 bgcolor='black'>";
   rv += "<tr bgcolor='#AABBCC' style='text-align:center;'>";
   rv += "<td>地區</td>";
   rv += "<td>日期</td>";
   rv += "<td>班別</td>";
   rv += "<td>電話號碼</td>";
   rv += "<td>聯單號碼</td>";
   rv += "<td>結果</td>";
   rv += "</tr>";
   obj.NewQuery("SELECT ID FROM VISITS WHERE team='"+team+"' AND DATE='"+date+"' AND phone='"+phone+"'");
   obj.NewTemplate(SitePath+"gifts\\search\\delids.wet");
   var list = obj.GenerateString(0,0);
   obj.ClearAll();
   obj.NewQuery("SELECT ID, ZONE, DATE, TEAM, PHONE, SERIAL, RESULT FROM VISITS WHERE team='"+team+"' AND DATE='"+date+"' AND phone='"+phone+"'");
   obj.NewTemplate(SitePath+"gifts\\give\\tree.wet");
   rv += obj.GenerateString(0,0);
	rv += "</table>";
   rv += "請確定是否要刪除，如按『ok』一經確認則資料需重新輸入<br>";
	rv += "<input class=\"button\" type=\"button\" onclick=\"delconfirmed('"+list+"')\" value=\"       OK       \">";
		
   Response.Write(escape(rv));

   obj = "";
%>
