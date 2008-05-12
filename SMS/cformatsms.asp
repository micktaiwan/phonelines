<script language="javascript">
function verify() {
   var f = document.fsform;
   var p = f.bulk.value;
	var tmp = f.Phone.value.split('/');
	var ampm = f.daypart.value;
	var phone = tmp[0];
	var name = tmp[1];
	allday = "";
	if(ampm == "整天") {
		ampm = "";
		allday = "，施工時間為上午九點至下午五點"
		}
   var m = "中華電信將於"+String(f.Month.value)+"月"+String(f.Day.value)+"日"+ampm+"到府施工"+allday+"，若需約時，請電洽"+phone+"工程師"+name+"先生。謝謝！";
   if(p=="") {
      alert("沒有電話號碼, 不能送出");
      return false;
      }
	if(!confirm("=========\n消息:\n"+m+"\n\n=========\n電話號碼:\n"+p)) return false;
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

</select>月 / <select name="Day">
<%
   for (i=1; i<=31; ++i) {
%>
<option value="<%=i%>" <%if(d==i){%>selected<%}%>><%=i%></option>
<%
   }
%>
</select> 
日
<select name="daypart">
<option value="整天">整天</option>
<option value="上午">上午</option>
<option value="下午">下午</option>
</select> 

※請輸入預施工日期</td></tr>
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
<td>傳送電話號碼<br>(一行一個):</td>
<td>
<textarea rows="3" cols="50" name="bulk">
</textarea>
<input type="hidden" value="" name="MESS">
</td>
</tr>

<tr><td>&nbsp;</td><td><input class="button" type="button" value="送出" onclick="verify();"></td></tr>
</table>
</form>
