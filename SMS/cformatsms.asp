<script language="javascript">
function verify() {
   var f = document.fsform;
   var p = f.bulk.value;
	var tmp = f.Phone.value.split('/');
	var ampm = f.daypart.value;
	var phone = tmp[0];
	var name = tmp[1];
	allday = "";
	if(ampm == "���") {
		ampm = "";
		allday = "�A�I�u�ɶ����W�ȤE�I�ܤU�Ȥ��I"
		}
   var m = "���عq�H�N��"+String(f.Month.value)+"��"+String(f.Day.value)+"��"+ampm+"�쩲�I�u"+allday+"�A�Y�ݬ��ɡA�йq��"+phone+"�u�{�v"+name+"���͡C���¡I";
   if(p=="") {
      alert("�S���q�ܸ��X, ����e�X");
      return false;
      }
	if(!confirm("=========\n����:\n"+m+"\n\n=========\n�q�ܸ��X:\n"+p)) return false;
   f.MESS.value = m;
   f.submit();
   return true;

   }
</script>
<%
   var now = new Date();
   var m = now.getMonth()+1;
   var d = now.getDate();
   var team  = GetSession("PHONECODE");
   obj.ClearAll();
   obj.Open("SELECT PHONES, NAME FROM personnel WHERE TEAM='"+team+"'");
   var phone = obj.Field("PHONES");
   var name = obj.Field("NAME");
   var display = GetSession("PHONENAME")+ " (" + team +") " + phone;
%>
<br>
<form name="fsform" action="sms/formatsmssend.asp" method="post">
<table border="0" cellspacing="0" cellpadding="0">
<tr><td>Date: </td><td><select name="Month">
<%
   var i;
   for (i=1; i<=12; ++i) {
%>
<option value="<%=i%>" <%if(m==i){%>selected<%}%>><%=i%></option>
<%
   }
%>

</select>�� / <select name="Day">
<%
   for (i=1; i<=31; ++i) {
%>
<option value="<%=i%>" <%if(d==i){%>selected<%}%>><%=i%></option>
<%
   }
%>
</select> 
��
<select name="daypart">
<option value="���">���</option>
<option value="�W��">�W��</option>
<option value="�U��">�U��</option>
</select> 

���п�J�w�I�u���</td></tr>
<tr><td>Phone: </td><td>

<%
if(phone != "") {
   Response.Write(display);%>
   <input type="hidden" name="Phone" value="<%=phone%>/<%=name%>"><%
   }
else {%>
<select name="Phone"><%
   obj.ClearAll();
   obj.NewQuery("SELECT TEAM, NAME, PHONES FROM personnel ORDER BY TEAM");
   obj.NewTemplate(SitePath+"sms\\formatsms.wet");
   obj.AddVar("C="+GetSession("PHONECODE"));
   obj.Generate(0,0);%>
</select><%
   }
%>
</td></tr>
<tr>
<td>�ǰe�q�ܸ��X<br>(�@��@��):</td>
<td>
<textarea rows="3" cols="50" name="bulk">
</textarea>
<input type="hidden" value="" name="MESS">
</td>
</tr>

<tr><td>&nbsp;</td><td><input class="button" type="button" value="�e�X" onclick="verify();"></td></tr>
</table>
</form>
