<%
if(Request.Form.Count>0) {
   Session("sRESP") = String(Request("RESPONSIBLE"));
   Session("sDATEFROM") = String(Request("DATEFROM"));
   Session("sDATETO") = String(Request("DATETO"));
   Session("sZONE") = String(Request("ZONE"));
   Session("sTEAM") = String(Request("TEAM"));
   Session("sAMPM") = String(Request("AMPM"));
   }
var resp = und(GetSession("sresp"));
var dateto   = und(GetSession("sdateto"));
var datefrom = und(GetSession("sdatefrom"));
var zone = und(GetSession("szone"));
var team = und(GetSession("steam"));
var ampm = und(GetSession("sampm"));
%>

<form name="addform" action="l.asp?P=repair&SP=search" method="post">
<table border="0" cellspacing="0" cellpadding="0">
<tr><td>輸入員: </td><td><input type="text" name="RESPONSIBLE" value="<%=resp%>"></td></tr>
<tr><td>從日期: </td><td><input type="text" name="DATEFROM" value="<%=datefrom%>"></td></tr>
<tr><td>到日期: </td><td><input type="text" name="DATETO" value="<%=dateto%>"></td></tr>
<tr><td>地區: </td><td><input type="text" name="ZONE" value="<%=zone%>"></td></tr>
<tr><td>班別: </td><td><input type="text" name="TEAM" value="<%=team%>"></td></tr>
<tr><td>聯單: </td><td><input type="text" name="SERIAL" value=""></td></tr>
<tr><td>電話: </td><td><input type="text" name="PHONE" value=""></td></tr>
<tr><td>上下: </td><td><input type="text" name="AMPM" value="<%=ampm%>"></td></tr>
<tr><td>&nbsp;</td><td><input class="button" type="submit" value="搜尋"></td></tr>
</table>
</form>

<table cellspacing="1" cellpadding="3" bgcolor="black">
<tr bgcolor="#AABBCC" style="font-weight:bold;text-align:center;">
<td>輸入員</td>
<td>日期</td>
<td>班別</td>
<td>號碼</td>
<td>電話</td>
<td>地區</td>
<td>上下</td>
<td>結果</td>
<td>刪除</td>
</tr>

<%
   var w = new Array();
   if(resp!="") w[1] = "RESPONSIBLE ='"+resp+"'";
   if(zone!="") w[2] = "ZONE ='"+zone+"'";
   if(team!="") w[3] = "TEAM ='"+team+"'";
   if(ampm!="") w[4] = "AMPM ='"+ampm+"'";
   if(dateto!="")   w[5] = "DATE <= '"+dateto+"'";
   if(datefrom!="") w[6] = "DATE >= '"+datefrom+"'";

   var str = "";
   for(i=1; i <7; i++) {
      if(String(w[i])!="undefined") {
         if(str!="") str += " AND ";
         str += w[i];
         }
      }

   //Response.Write(str);
   if(str!="") {
      obj.ClearAll();
      obj.NewQuery("SELECT * FROM repair WHERE "+str+" ORDER BY DATE DESC");
      obj.NewTemplate(SitePath+"repair\\tree.wet");

      obj.Generate(0,0);
      }
%>


</table>