<!-- <img src="images/bul1.gif"> <a href="repairlog/smslog/trackall.asp">��s�Ҧ������A</a> -->
<img src="images/bul1.gif"> <a onclick="if(!confirm('Are you sure ?')) return false" href="repairlog/smslog/deletebad.asp">�R���Ҧ������~������</a>
<img src="images/bul1.gif"> <a onclick="if(!confirm('Are you sure ?')) return false" href="repairlog/smslog/deletesucc.asp">�R���Ҧ����쪺����</a>
<br>
<br>

<%
   var cond = "";
   var all = String(Request("ALL"));
   if(all=="undefined") {
      var now = MyNow(0);
      cond = " AND SENTDATE >= '"+ now + "'";
      }
   if(admin=="3") cond += " AND MEMBERID=" + GetSession("PHONEID");
   cond += " AND companyid='"+company_id+"' "

   var sql1 = "SELECT COUNT(*) AS ID FROM sms WHERE DELETED=0 " + cond;
  
   obj.ClearAll();
   obj.DirectResponse = 1;
   obj.NewQuery(sql1);
   obj.NewTemplate(SitePath + "id.wet");
   var count = parseInt(obj.GenerateString(0,0));
   Response.Write(String(count) + "��²�T");

if(count>0) {
   var x = String(Request("X"));
   if(x == "undefined") x = 1;
   x = parseInt(x);
   var nb = 30;
   var z = nb;
   var y = x + (z-1);
   if(y > count) {
      y = count;
      z = (y-x)+1;
      }

   Response.Write("<br>" + String(x)+" - "+y+" ");
   var common = "<a href=\"l.asp?P=repairlog&SP=smslog";
   if(all!="undefined") common += "&ALL=1";
   common +=  "&X=";
   var previous = common +(x-nb)+"\">";
   var next = common +(x+z)+"\">";

   Response.Write("[");
   if(x-z > 0 ) Response.Write(previous);
   Response.Write("�W�@��</a>] ");
   Response.Write("[");
   if(y < count) Response.Write(next);
   Response.Write("�U�@��</a>]");
%>


<table BGCOLOR="#000000" cellpadding="3" cellspacing="1">
<tr style="font-weight:bold;" bgcolor="#DDAA00">
<td></td>
<% if (admin=="5") { %>
<td>�H��H</td>
<% } %>
<td>����H</td>
<td>���</td>
<td>����</td>
<td>���A</td>
</tr>
<%
   obj.ClearAll();
   var sql2 = "SELECT * FROM (SELECT TOP "+z+" * FROM (SELECT TOP "+y+" *, (SELECT NAME FROM reporters WHERE sms.memberID=reporters.ID) AS SENDER FROM sms WHERE DELETED=0 " + cond + " ORDER BY ID DESC) T1 ORDER BY ID ASC) T2 ORDER BY ID DESC";
   obj.NewQuery(sql2);
   obj.NewTemplate(SitePath+"repairlog\\smslog\\tree.wet");
   obj.AddVar(admin);
   obj.Generate(0,0);
%>
</table>
<br>
<%
   }
%>