<%
//Response.Write(Request.Form.Count);
//Response.Write(Request.QueryString.Count);

if(Request.Form.Count > 0) {
   Session("sTEAM") = String(Request("TEAM"));
   Session("sZONE") = String(Request("ZONE"));
   Session("sJOBTYPE") = String(Request("JOBTYPE"));
   Session("sDATEFROM") = String(Request("DATEFROM"));
   Session("sDATETO") = String(Request("DATETO"));
   }

var dateto   = und(GetSession("sdateto"));
var datefrom = und(GetSession("sdatefrom"));
var result = "undefined";
%>

<script language="javascript">

   function searchsub() {
      var form = document.addform;
      if(!checkNull(form.DATEFROM,"�q���")) return false;
      if(!checkNull(form.DATETO,"����")) return false;
   	form.submit();
   	return true;

      }

</script>


<form name="addform" action="l.asp?P=search&SP=<%=sp%>" method="post">
<table border="0" cellspacing="0" cellpadding="4">
<%
   if(admin!="4") {
      var team = "";
      var zone = und(GetSession("szone"));
	  var jobtype = und(GetSession("sjobtype"));
%>
<tr><td>�a��: </td><td><input type="text" name="ZONE" value="<%=zone%>" class="a90" style="height:14pt"></td></tr>
<tr><td>�u�@�O: </td><td><input type="text" name="JOBTYPE" value="<%=jobtype%>" class="a90" style="height:14pt"></td></tr>
<%
}// admin
else team = GetSession("PHONECODE");
 %>
<tr><td>�q���: </td><td><input type="text" name="DATEFROM" value="<%=datefrom%>" class="a90" style="height:14pt"> [ <a href="#" onclick="addform.DATEFROM.value = MyNow(0);">����</a> ]</td></tr>
<tr><td>����: </td><td><input type="text" name="DATETO" value="<%=dateto%>" class="a90" style="height:14pt"> [ <a href="#" onclick="addform.DATETO.value = MyNow(0);">����</a> ]</td></tr>
<!--<tr><td>�Ƨ�: </td><td><select name="rsort"><option value="2">���G,�a��</option><option value="1">�q��</option></select></td></tr>-->
<tr><td>�Ƨ�: </td><td>
<select name="filter">
<option value="0">�L���G</option>
<option value="1">�����G</option>
<option value="2">����</option>
</select>���̯Z�O�ƨ|��
</td></tr>
<tr><td>&nbsp;</td><td><input type="checkbox" name="count" value="1"> Count</td></tr>
<tr><td>&nbsp;</td><td><input class="button" type="button" onclick="searchsub()" value=" �j�@�M " class="a90" style="height:14pt"></td></tr>
</table>
</form>

<%
	var w = new Array();
	if(admin!="4" && zone!="") w[1] = "ZONE ='"+zone+"'";
	if(admin!="4" && zone!="" && jobtype!="") w[2] = "JOBTYPE ='"+jobtype+"'";
   
   if(team!="") w[3] = "TEAM ='"+team+"'";
   if(dateto!="")   w[4] = "DATE <= '"+dateto+"'";
   if(datefrom!="") w[5] = "DATE >= '"+datefrom+"'";

   var str = "";
   for(i=1; i <= 5; i++) {
      if(String(w[i])!="undefined") {
         if(str!="") str += " AND ";
         str += w[i];
         }
      }

   if(result!="undefined") {
      if(str!="") str += " AND ";
      str += "R='"+result+"'";
      }

   //if(result!="" && sp!="1" && sp!="2") str += " AND r!=''";
   if(str!="" && Request.Form.Count > 0) {
   var sort = "PHONE";
   //var rsort = String(Request("RSORT"));
   //if(rsort=="2") sort = "R, ZONE";
	sort = "TEAM,R,ZONE"
   var rfilter = String(Request("FILTER"));
   if(rfilter=="0") filter = "and R=''";
   else if(rfilter=="1") filter = "and R!=''";
	else filter = "";
   Response.Write(str+"<br>");
%>

<%
   var count = String(Request("count"));
   if(count=="1") {

      obj.ClearAll();
      var cond1 = "";
      if(admin=="3") cond1 = "AND visits.ZONE IN (SELECT CODE FROM zones JOIN repzones ON zones.ID=repzones.ZONE WHERE repzones.REP="+id+")";
%>
<table border="0" cellspacing="1" cellpadding="3" bgcolor="black">
<tr bgcolor="white"><td>�A��: </td><td>
<%
obj.Open("SELECT COUNT(*) AS S FROM VISITS WHERE "+str+" AND RESULT='�A��' "+cond1);
Response.Write(obj.Field("S"));
%>
</td></tr>
<tr bgcolor="white"><td>�h��: </td><td>
<%
obj.Open("SELECT COUNT(*) AS S FROM VISITS WHERE "+str+" AND RESULT='�h��' "+cond1);
Response.Write(obj.Field("S"));
%>
</td></tr>
<tr bgcolor="white"><td>��ê+�״_+���u:</td><td>
<%
obj.Open("SELECT COUNT(*) AS S FROM VISITS WHERE "+str+" AND (RESULT='��ê' OR RESULT='�״_' OR RESULT='���u') "+cond1);
Response.Write(obj.Field("S"));
%>
</td></tr>
</table>


<% } else { %>
<form action="l.asp?P=visits&SP=addfromrecords" method="post">
<input class="button" type="submit" value="�A�� / �j�� OK"><br>
<br>
      <table cellspacing="1" cellpadding="2" bgcolor="black">
      <!--#include file="tableheader.inc" -->
<%
      obj.ClearAll();
      obj.AddVar(GetSession("PHONEADMIN"));

      var cond1 = "";
      if(admin=="3") cond1 = "AND visits.ZONE IN (SELECT CODE FROM zones JOIN repzones ON zones.ID=repzones.ZONE WHERE repzones.REP="+id+")";
      var sql = "SELECT * FROM (SELECT visits.companyid, visits.ID, visits.ZONE, visits.JOBTYPE,visits.DATE, visits.TEAM, visits.PHONE, visits.SERIAL, visits.REASON, visits.MEMO, visits.CUSTNAME, visits.AMPM, \
         ISNULL(visits.RESULT,'') AS R, \
         '0' AS PCHECK, \
         (CASE WHEN EXISTS (SELECT TOP 1 ID FROM ZAIPAI WHERE ZAIPAIID=VISITS.ID) THEN '1' ELSE '0' END) AS ZAIPAIOK \
         FROM visits) X \
         WHERE "+str+" "+cond1+filter+" AND AMPM!='' AND COMPANYID='"+company_id+"' ORDER BY "+sort
         
      obj.NewQuery(sql);
		 obj.NewTemplate(SitePath+"search\\tree.wet");

      obj.DirectResponse = 1;
      obj.Generate(0,0);
%>
      </table>
</form>
<%
      } // count
   }
   //Response.Write(sql);
%>
