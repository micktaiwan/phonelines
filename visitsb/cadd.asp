<%
var e = String(Request("E"));
if(e=="1") Response.Write("<font color=red><b>OK</b></font><br>");
if(e=="2") Response.Write("<font size=4 color=red><strong>���~: ����M�q�ܭ���</strong></font><br>");

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
   if(!checkNull(form.RESPONSIBLE,"��J��")) return false;
   if(!checkNull(form.DATE,"���")) return false;
   //if(!checkNull(form.ZONE,"�a��")) return false;
   //if(!checkNull(form.TEAM,"�Z�O")) return false;
   //if(String(parseInt(form.TEAM.value))=="NaN") {alert('�Z�O���~');return false;}
   if(!checkNull(form.PHONE,"�q��")) return false;
   if((form.PHONE.value.indexOf(/[-a-z]/)>-1 || form.PHONE.value.length < 8)) {
      if(!confirm("���`�I���ˬd�O�_��J�q�ܥ��T\n�����T������")) return false;
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
            //alert("��:"+event.keyCode);
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
<tr><td>��J��: </td><td><input type="text" name="RESPONSIBLE" value="<%=resp%>"></td></tr>
<tr><td>���: </td><td><input type="text" name="DATE" value="<%=date%>"><font color="#AAAAAA">�p�G����S�����n, ��Ʒ|���h</font></td></tr>
<!--<tr><td>�a��: </td><td><input type="text" name="ZONE" value="<%=zone%>">
<select onchange="addform.ZONE.value=this.value">
<option value="">>----- ��� -----<</option>
<option value=""> </option>
<%//obj.Generate(0,0);%>
</select></td></tr>
-->
<tr><td>�Z�O: </td><td><input type="text" name="TEAM" value="<%=team%>">
<select onchange="addform.TEAM.value=this.value">
<option value="">>----- ��� -----<</option>
<option value=""> </option>
<%obj.Generate(1,1);%>
</select>
</td></tr>
<tr><td>�q��: </td><td><input type="text" name="PHONE" value=""></td></tr>
<tr><td>���G: </td><td>
<select name="RESULT">
<option value="-1">===</option>
<option value="0">���u</option>
<option value="1">�A��</option>
<option value="2">���P</option>
</select></td></tr>
<tr><td>��]: </td><td>
<select name="REASON">
<option value="-1">===</option>
<option value="0">ATUR�]��-Microfilter���}</option>
<option value="1">ATUR�]��-Splitter���}</option>
<option value="2">ATUC�]��-�d�����}</option>
<option value="3">LOOP�u��-���q�x�u�����}</option>
<option value="4">LOOP�u��-�l�u�u�����}</option>
<option value="5">�Ȥ�]��-�Τ��u</option>
<option value="6">�Ȥ�]��-�Ȥ�]��</option>
<option value="7">��L</option>
</select></td></tr>
<tr><td>�W��: </td><td><input type="text" name="UP" value=""></td></tr>
<tr><td>�U��: </td><td><input type="text" name="DOWN" value=""></td></tr>
<tr><td>&nbsp;</td><td><input class="button" onclick="javascript:verify();" type="button" value="OK"></td></tr>
</table>
</form>
