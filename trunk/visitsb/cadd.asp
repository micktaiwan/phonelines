<%
var e = String(Request("E"));
if(e=="1") Response.Write("<font color=red><b>OK</b></font><br>");
if(e=="2") Response.Write("<font size=4 color=red><strong>錯誤: 日期和電話重複</strong></font><br>");

var resp = und(GetSession("resp"));
if(resp=="") resp = GetSession("PHONECODE")
var date = GetSession("date");
if(date == "undefined") date = MyNow(0);
var zone = und(GetSession("zone"));
var team = und(GetSession("team"));
//var ampm = und(GetSession("ampm"));

      obj.ClearAll();
      obj.AddVar(GetSession("PHONEADMIN"));

      if(admin!="3")
         obj.NewQuery("SELECT CODE, NAME FROM zones ORDER BY CODE");
      else
         obj.NewQuery("SELECT repzones.ID, zones.NAME,zones.CODE FROM repzones LEFT OUTER JOIN zones ON zones.ID=repzones.ZONE where repzones.REP="+GetSession("PHONEID")+" ORDER BY zones.CODE");

      obj.NewTemplate(SitePath+"codename2.wet");
      if(admin!="3")
         obj.NewQuery("SELECT TEAM, CODE,NAME FROM personnel ORDER BY TEAM");
      else
         obj.NewQuery("SELECT repteam.ID, personnel.TEAM, personnel.NAME, personnel.CODE FROM repteam LEFT OUTER JOIN personnel ON personnel.ID=repteam.TEAM where repteam.REP="+GetSession("PHONEID")+" ORDER BY personnel.CODE");
      obj.NewTemplate(SitePath+"codename3.wet");
%>

<script language="javascript">
function verify () {

   var form = document.addform;
   if(!checkNull(form.RESPONSIBLE,"輸入員")) return false;
   if(!checkNull(form.DATE,"日期")) return false;
   //if(!checkNull(form.ZONE,"地區")) return false;
   //if(!checkNull(form.TEAM,"班別")) return false;
   //if(String(parseInt(form.TEAM.value))=="NaN") {alert('班別錯誤');return false;}
   if(!checkNull(form.PHONE,"電話")) return false;
   if((form.PHONE.value.indexOf(/[-a-z]/)>-1 || form.PHONE.value.length < 8)) {
      if(!confirm("異常！請檢查是否輸入電話正確\n不正確按取消")) return false;
      }
	form.submit();
	return true;

   }

function catchKey(event,object) {
   var form = document.addform;
   //alert(object.name);
/*
   switch(object.name) {
      case "PHONE" :
         if(String(object.value).length == 7) {
            if(event.keyCode >= 96) event.keyCode = event.keyCode - 48;
            object.value = String(object.value) + String.fromCharCode(event.keyCode);
            //alert("陳:"+event.keyCode);
            form.AMPM.focus();
            event.returnValue = false;
            return false;
            }
         break;

      if(event.keyCode==13) verify(); return false;
      }
*/

    return true;

    }

</script>

<form name="addform" action="visitsb/add.asp" method="post">
<table border="0" cellspacing="0" cellpadding="0">
<tr><td>輸入員: </td><td><input type="text" name="RESPONSIBLE" value="<%=resp%>"></td></tr>
<tr><td>日期: </td><td><input type="text" name="DATE" value="<%=date%>"><font color="#AAAAAA">如果日期沒有打好, 資料會失去</font></td></tr>
<!--<tr><td>地區: </td><td><input type="text" name="ZONE" value="<%=zone%>">
<select onchange="addform.ZONE.value=this.value">
<option value="">>----- 選擇 -----<</option>
<option value=""> </option>
<%//obj.Generate(0,0);%>
</select></td></tr>
-->
<tr><td>班別: </td><td><input type="text" name="TEAM" value="<%=team%>">
<select onchange="addform.TEAM.value=this.value">
<option value="">>----- 選擇 -----<</option>
<option value=""> </option>
<%obj.Generate(1,1);%>
</select>
</td></tr>
<tr><td>電話: </td><td><input type="text" name="PHONE" value=""></td></tr>
<tr><td>結果: </td><td>
<select name="RESULT">
<option value="-1">===</option>
<option value="0">竣工</option>
<option value="1">再派</option>
<option value="2">註銷</option>
</select></td></tr>
<tr><td>原因: </td><td>
<select name="REASON">
<option value="-1">===</option>
<option value="0">ATUR因素-Microfilter不良</option>
<option value="1">ATUR因素-Splitter不良</option>
<option value="2">ATUC因素-卡片不良</option>
<option value="3">LOOP線路-測量台線路不良</option>
<option value="4">LOOP線路-纜線線路不良</option>
<option value="5">客戶因素-屋內線</option>
<option value="6">客戶因素-客戶設備</option>
<option value="7">其他</option>
</select></td></tr>
<tr><td>上行: </td><td><input type="text" name="UP" value=""></td></tr>
<tr><td>下行: </td><td><input type="text" name="DOWN" value=""></td></tr>
<tr><td>&nbsp;</td><td><input class="button" onclick="javascript:verify();" type="button" value="OK"></td></tr>
</table>
</form>
