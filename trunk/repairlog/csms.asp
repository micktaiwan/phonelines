<%
   if(!IsLogged("PHONE") || GetSession("PHONEADMIN") == "0") Response.End();
%>
不要濫用簡訊功能 不是免費的<br>
<br>

<script language="javascript">

   function updatesmslen(i) {

      var lfield = eval("document.smsform.len"+i);
      var cfield = eval("document.smsform.MESS"+i);
      cfield.value = cfield.value.replace(/^\s+|\s+$/g,'');
      lfield.value = cfield.value.length;

      }

   function onecheckedsmsform() {

      var f = document.smsform.check;
      var i;
      for(i=0; i < f.length;i++)
         if(f[i].checked) return true;

      return false;

      }

   function verlengthsmsform() {

      var f = document.smsform.check;
      if(f==null) {
         alert('no sms');
         return;
         }
      var c = "document.smsform.MESS";
      var i;
      
      for(i=0; i < f.length;i++)
         if(f[i].checked) {
            if(eval(c+f[i].value).value.length > 69) {
               alert('This message is too long\n'+eval(c+f[i].value).value);
               eval(c+f[i].value).focus();
               return false;
               }
            }
      return true;

      }

   function versmsform() {

      //if(!onecheckedsmsform()) {
      //   alert('You must check at least one checkbox');
      //   return false;
      //   }
      if(!verlengthsmsform()) return false;

      document.smsform.submit();
      return true;

      }

</script>

<form name="smsform" action="repairlog/smssend.asp" method="post">
<table cellspacing="1" cellpadding="2" bgcolor="black">
<tr bgcolor="#3366AA"  style="font-weight:bold;font-size:12pt;color:#DDDDFF;text-align=center;">
<td>收件人</td>
<td>消息</td>
<td>長度</td>
<td>送過簡訊</td>
<td>送簡訊 ?</td>
</tr>
<%
      obj.ClearAll();
      obj.AddVar(GetSession("PHONEADMIN"));
      var cond1 = "";
      if(admin=="3") cond1 = " AND visits.ZONE IN (SELECT CODE FROM zones JOIN repzones ON zones.ID=repzones.ZONE WHERE repzones.REP="+GetSession("PHONEID")+")";
      cond1 += " AND visits.companyid='"+company_id+"'"
      obj.NewQuery("SELECT repairlog.*, ISNULL(repairlog.SMS,0) AS SMS, personnel.ID as PID, personnel.NAME, personnel.PHONES FROM repairlog LEFT OUTER JOIN visits ON repairlog.VISITID=visits.ID LEFT OUTER JOIN personnel on visits.TEAM=personnel.TEAM WHERE CORRECTED=0 "+cond1+" ORDER BY SMS");
      obj.NewTemplate(SitePath+"repairlog\\sms.wet");
      obj.DirectResponse = 1;
      obj.Generate(0,0);
%>
</table><br>
<!--<input type="checkbox" value="asd" name="checks">-->
<!--
<input type="radio" value="0" name="UsingTiming" checked> 立即傳送<br>
<input type="radio" value="1" name="UsingTiming"> 預約傳送 <input type="text" name="SendDate" value="<%=MyNow(1)%>"><br>
-->
<input type="button" class="button" onclick="versmsform();" value="送簡訊">
</form>
