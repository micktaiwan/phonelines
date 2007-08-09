<%
   var matcode = String(Request("MATCODE"));
   obj.ClearAll();
   obj.NewQuery("SELECT ID, NAME, UNIT, SUPPLIER FROM BOMMATERIAL WHERE CODE='"+matcode+"'");
   obj.NewTemplate(SitePath+"BOM/job/teamjob/add2-3.wet");
   obj.NewTemplate(MMSitePath+"id.wet");
   var str = obj.GenerateString(0,0);
   var id = obj.GenerateString(0,1);
   if(id=="") {
%>
<strong>材料代碼錯誤</strong><br>
<%
      }
   else {
   Session("TEAMJOBADD2MATID") = id;
%>
<style>
.abc {
   border:1px solid #DDCCBB;
   background-color:#FFEEDD;
   }
</style>
<form name="addform" action="bom/job/teamjob/add2-3.asp" method="post">
<table border="0" cellspacing="2" cellpadding="1">
<%=str%>
<tr><td>實用數量:</td><td><input type="text" name="USEDQTY" value=""></td></tr>
<tr><td>餘長:</td><td><input type="text" name="SURPLUS" value=""></td></tr>
<tr><td>損耗:</td><td><input type="text" name="LOSS" value=""></td></tr>
<tr><td>&nbsp;</td><td><input class="button" type="button" onclick="submitaddform4();" value="增加"></td></tr>
</table>
</form>
<%
   }
%>
