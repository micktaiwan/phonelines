<img src="images/attention.gif"> [ <a href="l.asp?P=visits&SP=add2">�s����J�k<a/> ]<br>
<br>



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
      obj.DirectResponse = 1;
      obj.NewQuery("SELECT COUNT(ID) AS C FROM VISITS WHERE RESPONSIBLE='"+GetSession("PHONECODE")+"'");
      obj.NewTemplate(SitePath+"visits\\stats.wet");
      obj.Generate(0,0);

      obj.ClearAll();
      obj.AddVar(GetSession("PHONEADMIN"));
      
      if(admin!="3")
         obj.NewQuery("SELECT CODE, NAME FROM zones ORDER BY CODE");
      else
         obj.NewQuery("SELECT repzones.ID, zones.NAME,zones.CODE FROM repzones LEFT OUTER JOIN zones ON zones.ID=repzones.ZONE where repzones.REP="+GetSession("PHONEID")+" ORDER BY zones.CODE");

      obj.NewTemplate(SitePath+"codename2.wet");
      if(admin!="3")
         obj.NewQuery("SELECT TEAM, CODE,NAME FROM personnel where personnel.DEPARTURE='' ORDER BY TEAM");
      else
         obj.NewQuery("SELECT repteam.ID, personnel.TEAM, personnel.NAME, personnel.CODE FROM repteam LEFT OUTER JOIN personnel ON personnel.ID=repteam.TEAM where repteam.REP="+GetSession("PHONEID")+"  and personnel.DEPARTURE='' ORDER BY personnel.CODE");
      obj.NewTemplate(SitePath+"codename3.wet");
%>

<script language="javascript">
function verify () {

   var form = document.addform;
   if(!checkNull(form.ZONE,"�a��")) return false;
   if(!checkNull(form.RESPONSIBLE,"��J��")) return false;
   if(!checkNull(form.DATE,"���")) return false;
   if(!checkNull(form.ZONE,"�a��")) return false;
   if(!checkNull(form.TEAM,"�Z�O")) return false;
   if(String(parseInt(form.TEAM.value))=="NaN") {alert('�Z�O���~');return false;}
   if(!checkNull(form.SERIAL,"�p��")) return false;
   if(!checkNull(form.PHONE,"�q��")) return false;
   if((form.PHONE.value.indexOf(/[-a-z]/)>-1 || form.PHONE.value.length < 8)) {
      if(!confirm("���`�I���ˬd�O�_��J�q�ܥ��T\n�����T������")) return false;
      }
   if(form.SERIAL.value.length < 12) {
      if(!confirm("���`�I���ˬd�O�_��J�p�楿�T\n�����T������")) return false;
      }
	form.submit();
	return true;
   
   }

function catchKey(event,object) {
   var form = document.addform;
   //alert(object.name);
   switch(object.name) {
      case "SERIAL" :
         if(String(object.value).length == 11) {
            if(event.keyCode >= 96) event.keyCode = event.keyCode - 48;
            object.value += String.fromCharCode(event.keyCode);
            event.returnValue = false;
            form.PHONE.focus();
            return false;
            }
         break;
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
      case "AMPM" : 
         if(String(object.value).length == 1) {
            if(event.keyCode >= 96) event.keyCode = event.keyCode - 48;
            object.value += String.fromCharCode(event.keyCode);
            verify();
            event.returnValue = false;
            return false;
            }

      if(event.keyCode==13) verify(); return false;
      }
      
    return true;
    
    }



</script>

<form name="addform" action="visits/add.asp" method="post">
<table border="0" cellspacing="0" cellpadding="0">
<tr><td>��J��: </td><td><input type="text" name="RESPONSIBLE" value="<%=resp%>"></td></tr>
<tr><td>���: </td><td><input type="text" name="DATE" value="<%=date%>"><font color="#AAAAAA">�p�G����S�����n, ��Ʒ|���h</font></td></tr>
<tr><td>�a��: </td><td>
<select name="ZONE" onchange="zonechange(this.value);">
<option value="">>----- ��� -----<</option>
<option value=""> </option>
<%obj.Generate(0,0);%>
</select>
�p�G�A�n���a�Ͽ�ܬO�ťժ�,�Х���<a href="l.asp?P=zones">���إ�</a>
</td></tr>
<tr><td>�u�@�O:</td><td>
<select name="JOBTYPE">
<option value="0">0 �˲���</option>
<option value="1">1 ADSL</option>
<option value="2">2 ��u</option>
<option value="3">3 ���</option>
<option value="4">4 ADL��</option>
<option value="5">5 MOD</option>
<option value="6">6 FTTB</option>
</select>
</td></tr>
<tr><td>�Z�O: </td><td><input type="text" name="TEAM" value="<%=team%>">
<select onchange="addform.TEAM.value=this.value">
<option value="">>----- ��� -----<</option>
<option value=""> </option>
<%obj.Generate(1,1);%>
</select>
</td></tr>
<tr><td>�p��: </td><td><input onkeydown="catchKey(event,this)" type="text" name="SERIAL" value="" focused></td></tr>
<tr><td>�q��: </td><td><input onkeydown="catchKey(event,this);" type="text" name="PHONE" value=""></td></tr>
<tr><td>�W�U: </td><td><input onkeydown="catchKey(event,this);" type="text" name="AMPM" value=""></td></tr>
<tr><td>&nbsp;</td><td><input class="button" onclick="javascript:verify();" type="button" value="OK"></td></tr>
</table>
</form>
<br>
<img src="images/lastchanges.gif"><br>
<b>�нT�{�A���J����ƥX�{�F</b><br>
<br>
<table cellspacing="1" cellpadding="3" bgcolor="black">
<!--#include file="tableheader.inc" -->
<%
      obj.ClearAll();
      obj.AddVar(GetSession("PHONEADMIN"));
      if(admin!="3")
         obj.NewQuery("SELECT TOP 3 visits.*, CASE WHEN visits.phone LIKE '%[-a-z]%' THEN '1' WHEN visits.phone NOT LIKE '%[-a-z]%' THEN '0' ELSE '0' END AS PCHECK, personnel.NAME, repairlog.COMPLAINSEX, repairlog.COMPLAINNAME, repairlog.COMPLAINOPHONE, repairlog.COMPLAINHPHONE, repairlog.COMPLAINCPHONE FROM visits LEFT OUTER JOIN personnel ON visits.TEAM=personnel.TEAM LEFT OUTER JOIN repairlog ON repairlog.VISITID=visits.ID ORDER BY visits.ID DESC");
      else 
         obj.NewQuery("SELECT TOP 3 visits.*, CASE WHEN visits.phone LIKE '%[-a-z]%' THEN '1' WHEN visits.phone NOT LIKE '%[-a-z]%' THEN '0' ELSE '0' END AS PCHECK, personnel.NAME, repairlog.COMPLAINSEX, repairlog.COMPLAINNAME, repairlog.COMPLAINOPHONE, repairlog.COMPLAINHPHONE, repairlog.COMPLAINCPHONE FROM visits LEFT OUTER JOIN personnel ON visits.TEAM=personnel.TEAM LEFT OUTER JOIN repairlog ON repairlog.VISITID=visits.ID WHERE visits.ZONE IN (SELECT CODE FROM zones JOIN repzones ON zones.ID=repzones.ZONE WHERE repzones.REP="+GetSession("PHONEID")+" ) ORDER BY visits.ID DESC");
      obj.NewTemplate(SitePath+"visits\\tree.wet");

      obj.Generate(0,0);
%>

</table>

