<%
//Response.Write(Request.Form.Count);
//Response.Write(Request.QueryString.Count);

var result;
var team = "";
var datefrom = "";
var dateto = "";

if(Request.Form.Count > 0) {
   result = und(String(Request("SRESULT")));
   if(result=="") result = -2;
   phone = und(String(Request("SPHONE")));
   if(phone!="") Session("sPHONE") = phone;
   Session("sRESULT") = result;
   Session("sTEAM") = String(Request("TEAM"));
   Session("sDATEFROM") = String(Request("DATEFROM"));
   Session("sDATETO") = String(Request("DATETO"));
   }

if(phone=="") {
   team       = und(GetSession("steam"));
   dateto     = und(GetSession("sdateto"));
   datefrom   = und(GetSession("sdatefrom"));
   }
%>

<script language="javascript">
   function searchsub() {
      var form = document.addform;
      if(!checkNull(form.DATEFROM,"�q���")) return false;
      if(!checkNull(form.DATETO,"����")) return false;
   	form.submit();
   	return true;
      }
   function searchsub2() {
      var form = document.phonesearch;
      if(!checkNull(form.SPHONE,"�q�ܸ��X")) return false;
   	form.submit();
   	return true;
      }
</script>
<table width="100%" class="logbox">
<tr><td width="33%">
<form name="addform" action="l.asp?P=visitsb&SP=search" method="post">
<table border="0" cellspacing="0" cellpadding="4">
<tr><td>�Z�O: </td><td><input type="text" name="TEAM" value="<%=team%>" class="a90" style="height:14pt"></td></tr>
<tr><td>�q���: </td><td><input type="text" name="DATEFROM" value="<%=datefrom%>" class="a90" style="height:14pt"> [ <a href="#" onclick="addform.DATEFROM.value = MyNow(0);">����</a> ]</td></tr>
<tr><td>����: </td><td><input type="text" name="DATETO" value="<%=dateto%>" class="a90" style="height:14pt"> [ <a href="#" onclick="addform.DATETO.value = MyNow(0);">����</a> ]</td></tr>
<tr><td>���G: </td><td><select name="SRESULT">
<option value="-2">�Ҧ�</option>
<option value="-1" <%if(result=="-1") Response.Write("selected")%>>����</option>
<option value="0" <%if(result=="0") Response.Write("selected")%>>���u</option>
<option value="1" <%if(result=="1") Response.Write("selected")%>>�A��</option>
<option value="2" <%if(result=="2") Response.Write("selected")%>>���P</option>
</select></td></tr>
<tr><td>�Ƨ�: </td><td><select name="rsort"><option value="2">���G</option><option value="1">�q��</option></select></td></tr>
<tr><td>&nbsp;</td><td><input class="button" type="button" onclick="searchsub()" value=" �j�@�M " class="a90" style="height:14pt"></td></tr>
</table>
</form>
</td><td width="33%">
<form name="phonesearch" action="l.asp?P=visitsb&SP=search" method="post">
<table border="0" cellspacing="0" cellpadding="4">
<tr><td>�q�ܸ��X: </td><td><input type="text" name="SPHONE" value="<%=phone%>" class="a90" style="height:14pt"></td></tr>
<tr><td>&nbsp;</td><td><input class="button" type="button" onclick="searchsub2()" value=" �j�@�M " class="a90" style="height:14pt"></td></tr>
</table>
</form>
</td>
</tr>
</table>

<%
   var w = new Array();
   if(phone!="") w[1] = "PHONE ='"+phone+"'";
   if(team!="") w[2] = "TEAM ='"+team+"'";
   if(dateto!="")   w[3] = "DATE <= '"+dateto+"'";
   if(datefrom!="") w[4] = "DATE >= '"+datefrom+"'";
   if(result!="-2") w[5] = "RESULT = '"+result+"'";

   var str = "";
   for(i=1; i <= 5; i++) {
      if(String(w[i])!="undefined") {
         if(str!="") str += " AND ";
         str += w[i];
         }
      }


   if(str!="" && Request.Form.Count > 0) {
   var sort = "PHONE";
   var rsort = String(Request("RSORT"));
   if(rsort=="2") sort = "RESULT";
   //Response.Write(str);
%>

      <a class="linkbut" href="#" onclick="document.printform.submit();"><img src="images/point_06.gif" border="0"> �C�L</a><br>
      <br>
      <table cellspacing="1" cellpadding="2" bgcolor="black">
      <!--#include file="tableheader.inc" --><%
      obj.ClearAll();
      obj.AddVar(GetSession("PHONEADMIN"));
      var cond1 = "";
      //if(admin=="3") cond1 = "WHERE visitsb.ZONE IN (SELECT CODE FROM zones JOIN repzones ON zones.ID=repzones.ZONE WHERE repzones.REP="+GetSession("PHONEID")+")";
      obj.NewQuery("SELECT * FROM (SELECT visitsb.*, CASE WHEN visitsb.phone LIKE '%[-a-z]%' THEN '1' WHEN visitsb.phone NOT LIKE '%[-a-z]%' THEN '0' ELSE '0' END AS PCHECK, ISNULL(visitsb.RESULT,'') AS R, personnel.NAME FROM visitsb LEFT OUTER JOIN personnel ON visitsb.TEAM=personnel.TEAM "+cond1+") X WHERE "+str+" ORDER BY "+sort);
      obj.NewTemplate(SitePath+"visitsb\\tree.wet");
      obj.DirectResponse = 1;
      obj.Generate(0,0);%>
      </table><%
      }
%>
<form name="printform" action="print/cpvisitsb.asp" method="post">
<input type="hidden" name="WHERE" value="<%=str%> ORDER BY <%=sort%>">
</form>
