<script language="javascript">
function verify () {

   var form = document.addform;
   if(!checkNull(form.CODE,"CODE")) return false;
   if(!checkNull(form.NAME,"名字")) return false;
   var sms = document.addform.smsphone;
 	if (sms.value != '' && sms.value.length != 10) {
		alert("SMS phone number must 10 chars long.\nEnter no spaces or other signs but digits.\nOnly Taiwanese cell phone numbers are allowed.");
		sms.focus();
		return(false);
		}

	form.submit();
	return true;

   }

</script>

<table width="100%">
<tr><td>
<b>權利:</b><br>
<%
      var k = String(Request("K"));

      obj.ClearAll();
      obj.NewQuery("SELECT ADMIN AS ID FROM reporters where id="+k);
      obj.NewTemplate(SitePath+"id.wet");
      obj.DirectResponse = 1;
      var a = obj.GenerateString(0,0);

      obj.ClearAll();
      obj.NewQuery("SELECT * FROM reporters where id="+k);
      obj.NewTemplate(SitePath+"reporters\\edit.wet");
      obj.NewQuery("SELECT * FROM reportergroups where companyid='"+company_id+"' order by name");
      obj.NewTemplate(SitePath+"reporters\\groups\\option.wet");
      obj.DirectResponse = 0;
      obj.Generate(0,0);
%>
</td>
<%
if(a=="3") {

//--------------------------
// ZONES
//--------------------------

%>



<td>
<b>地區:</b><br>
<br>
<table bgcolor="#334455" cellspacing="1" cellpadding="5">
<tr bgcolor="#8899AA" style="font-weight:bold;">
<td>#</td>
<td>Code</td>
<td>Name</td>
<td>Del</td>
</tr>

<%
      obj.ClearAll();
      obj.AddVar("k="+k);
      obj.NewQuery("SELECT repzones.ID, zones.NAME,zones.CODE FROM repzones LEFT OUTER JOIN zones ON zones.ID=repzones.ZONE where repzones.REP="+k+" ORDER BY zones.CODE");
      obj.NewTemplate(SitePath+"reporters\\zones.wet");
      obj.DirectResponse = 1;
      obj.Generate(0,0);
%>
</table>
<form action="reporters/addzone.asp" method="post">
<select name="ZONE">
<%
      obj.ClearAll();
      obj.NewQuery("SELECT * FROM zones ORDER BY CODE");
      obj.NewTemplate(SitePath+"reporters\\zoneoption.wet");
      obj.Generate(0,0);
%>
</select>
<input type="hidden" name="REP" value="<%=k%>">
<input type="submit" class="button" value="增加這個地區">

</form>
</td>
<%
//--------------------------
// TEAM
//--------------------------
%>
<td>
<b>班別:</b><br>
<br>
<table bgcolor="#334455" cellspacing="1" cellpadding="5">
<tr bgcolor="#8899AA" style="font-weight:bold;">
<td>#</td>
<td>Code</td>
<td>Name</td>
<td>Del</td>
</tr>
<%
      obj.ClearAll();
      obj.AddVar("k="+k);
      obj.NewQuery("SELECT repteam.ID, personnel.NAME, personnel.CODE FROM repteam LEFT OUTER JOIN personnel ON personnel.ID=repteam.TEAM where repteam.REP="+k+" ORDER BY personnel.CODE");
      obj.NewTemplate(SitePath+"reporters\\teams.wet");
      obj.Generate(0,0);
%>
</table>
<form action="reporters/addteam.asp" method="post">
<select name="TEAM">
<%
      obj.ClearAll();
      obj.NewQuery("SELECT ID,CODE,TEAM,NAME FROM personnel ORDER BY TEAM");
      obj.NewTemplate(SitePath+"reporters\\teamoption.wet");
      obj.Generate(0,0);
%>
</select>
<input type="hidden" name="REP" value="<%=k%>">
<input type="submit" class="button" value="增加這個班別">

</form>
</td>


<% } %>
<td>
<b>簡訊:</b><br>
<form action="reporters/edit.asp?K=<%=k%>" method="post">
<%
      obj.ClearAll();
      obj.NewQuery("SELECT SMSLEFT FROM reporters where id="+k);
      obj.NewTemplate(SitePath+"reporters\\smsleft.wet");
      obj.Generate(0,0);
%>
<input type="submit" class="button" value="改變">
</form><br>
<br>
<b>簡訊帳號:</b><br>
<form action="reporters/edit.asp?K=<%=k%>" method="post">
<select name="smshnid">
<option value="-1">===Not defined===</option>
<%
      obj.ClearAll();
      obj.Open("SELECT SMSHNID AS ID FROM reporters WHERE ID="+k);
      var smshnid = obj.Field("ID");

      obj.ClearAll();
      obj.NewQuery("SELECT ID, NAME FROM smshn WHERE COMPANYID='"+company_id+"' ORDER BY NAME");
      obj.NewTemplate(SitePath+"reporters\\smshn\\option.wet");
      obj.AddVar("HNID="+smshnid);
      obj.Generate(0,0);
%>
</select>
<input type="submit" class="button" value="改變">
</form>
</td>
</tr>
</table>
