<%
   var now = new Date();
   var thisy = now.getYear();
   var thism = now.getMonth()+1;

   var y = String(Request("Y"));
   var m = String(Request("m"));
   if(y=="undefined") y = thisy;
   if(m=="undefined") m = thism;
%>
<form name="addform" action="" method="post">
<table border="0" cellspacing="0" cellpadding="4">
<tr><td>年: </td><td>
<select name="y">
<option value="2008" <%if(y=="2008") Response.Write("selected")%>>2008</option>
<option value="2007" <%if(y=="2007") Response.Write("selected")%>>2007</option>
<option value="2006" <%if(y=="2006") Response.Write("selected")%>>2006</option>
<option value="2005" <%if(y=="2005") Response.Write("selected")%>>2005</option>
<option value="2004" <%if(y=="2004") Response.Write("selected")%>>2004</option>
<option value="2003" <%if(y=="2003") Response.Write("selected")%>>2003</option>
<option value="2002" <%if(y=="2002") Response.Write("selected")%>>2002</option>
</select>
</td><td>月: </td><td>
<select name="m">
<option value="1" <%if(m=="1") Response.Write("selected")%>>1</option>
<option value="2" <%if(m=="2") Response.Write("selected")%>>2</option>
<option value="3" <%if(m=="3") Response.Write("selected")%>>3</option>
<option value="4" <%if(m=="4") Response.Write("selected")%>>4</option>
<option value="5" <%if(m=="5") Response.Write("selected")%>>5</option>
<option value="6" <%if(m=="6") Response.Write("selected")%>>6</option>
<option value="7" <%if(m=="7") Response.Write("selected")%>>7</option>
<option value="8" <%if(m=="8") Response.Write("selected")%>>8</option>
<option value="9" <%if(m=="9") Response.Write("selected")%>>9</option>
<option value="10" <%if(m=="10") Response.Write("selected")%>>10</option>
<option value="11" <%if(m=="11") Response.Write("selected")%>>11</option>
<option value="12" <%if(m=="12") Response.Write("selected")%>>12</option>
</select>
</td></tr>
<tr><td>&nbsp;</td><td><input class="button" type="submit" value=" 搜　尋 " class="a90" style="height:14pt"></td></tr>
</table>
</form>


<%
   d1 = y+"/"+m+"/1";
   m = parseInt(m)+1;
   if(m==13) {y = parseInt(y)+1;m=1};
   d2 = y+"/"+m+"/1";

   Response.Write("從日期:" + d1 + "<br>到日期: " + d2+"<br>");
%>
<br>
<table cellspacing="1" cellpadding="2" bgcolor="black">
<tr bgcolor="#AAAAFF" style="text-align:center;">
<td>姓名</td>
<td>統計</td>
</tr>

<%
   obj.ClearAll();
   obj.NewQuery("SELECT ISNULL(personnel.NAME,'不知道(可能刪除)')AS NAME, COUNT(sms.ID) AS C FROM sms LEFT OUTER JOIN personnel ON personnel.ID=sms.PERSONNELID WHERE sms.RESULT=0 AND sms.SENTDATE >= '"+d1+"' AND sms.SENTDATE < '"+d2+"' AND sms.companyid='"+company_id+"' GROUP BY personnel.NAME ORDER BY C DESC");
   obj.NewTemplate(SitePath+"repairlog\\smscount\\tree.wet");

   obj.DirectResponse = 1;
   obj.Generate(0,0);
%>


</table>
