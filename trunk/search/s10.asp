問題:<br>
<li><a href="l.asp?P=search&SP=11">結果</a></li>
<li><a href="l.asp?P=search&SP=12">地區</a></li>
<br>
<%
//Response.Write(Request.Form.Count);
//Response.Write(Request.QueryString.Count);

if(Request.Form.Count > 0) {
   Session("sZONE") = String(Request("ZONE"));
   Session("sTEAM") = String(Request("TEAM"));
   Session("sDATEFROM") = String(Request("DATEFROM"));
   Session("sDATETO") = String(Request("DATETO"));
   }
var dateto   = und(GetSession("sdateto"));
var datefrom = und(GetSession("sdatefrom"));
var zone = und(GetSession("szone"));
var team = und(GetSession("steam"));
if(admin=="4") {
team = GetSession("PHONECODE")
}


%>

<script language="javascript">

  function searchsub() {
		var form = document.addform;
    if(!checkNull(form.DATEFROM,"從日期")) return false;
    if(!checkNull(form.DATETO,"到日期")) return false;
   	form.submit();
   	return true;
    }
	function zonechange_result(txt) {
		if(txt=="") g('zonetext').innerHTML = "No results";
		else g('zonetext').innerHTML = txt;
		}
	function zonechange(value) {
      g('zonetext').innerHTML = 'Searching...';
		majax.get("search/getzones.asp?S="+value,zonechange_result);
		}
		
</script>

<form name="addform" action="l.asp?P=search&SP=<%=sp%>" method="post">
<table border="0" cellspacing="0" cellpadding="4">
<tr><td>從日期: </td><td><input type="text" name="DATEFROM" value="<%=datefrom%>" class="a90" style="height:14pt"> [ <a href="#" onclick="addform.DATEFROM.value = MyNow(0);">今天</a> ]</td></tr>
<tr><td>到日期: </td><td><input type="text" name="DATETO" value="<%=dateto%>" class="a90" style="height:14pt"> [ <a href="#" onclick="addform.DATETO.value = MyNow(0);">今天</a> ]</td></tr>
<tr><td>地區: </td><td>
<input type="text" name="ZONE" value="<%=zone%>" onkeyup="zonechange(this.value)">
</td></tr>
<tr><td>班別: </td><td>
<input type="text" name="TEAM" value="<%=team%>" <%if(admin=="4"){%>readonly<%}%>>
</td></tr>
<tr><td>&nbsp;</td><td><input class="button" type="button" onclick="searchsub()" value=" 搜　尋 " class="a90" style="height:14pt"></td></tr>
</table>
</form>

此搜尋需一分鐘以上時間,請耐心等候!!!<br/>
<br/>

<div id="zonetext"></div>

<%
   if(Request.Form.Count > 0) {
%>
<table cellspacing="1" cellpadding="2" bgcolor="black">
<tr bgcolor="#AABBCC" style="text-align:center;">
<td rowspan="2"><%if(team==''){%>班別<%}else{%>日期<%}%></td>
<td rowspan="2">合計</td>
<td colspan="8">竣工+障礙+修復</td>
<td rowspan="2">再派</td>
<td rowspan="2">退件</td>
<td rowspan="2">拆線</td>
<td colspan="8">結果不明</td>
</tr>
<tr bgcolor="#AABBCC" style="text-align:center;">
<td>裝移機</td><td>ADSL</td><td>FTTB</td><td>MOD</td><td>FTTB+MOD</td><td>拆線</td><td>拆ADSL</td><td>更模</td>
<td>裝移機</td><td>ADSL</td><td>FTTB</td><td>MOD</td><td>FTTB+MOD</td><td>拆線</td><td>拆ADSL</td><td>更模</td>
</tr>
</tr>

<%
	obj.ClearAll();

	//obj.AddVar(GetSession("PHONEADMIN"));
	//var cond1 = "";
	//if(admin=="3") cond1 = " AND visits.ZONE IN (SELECT CODE FROM zones JOIN repzones ON zones.ID=repzones.ZONE WHERE repzones.REP="+GetSession("PHONEID")+")";
   //obj.Execute("SELECT * INTO #TMPSEARCH FROM visits AS V WHERE "+cond);

   obj.NewQuery("SELECT ZONE FROM VISITS WHERE LEFT(ZONE," + zone.length+")='"+zone+"' AND COMPANYID='"+company_id+"' GROUP BY ZONE");
   obj.NewTemplate(SitePath+"search\\zone_list.wet");
	obj.DirectResponse = 1;
	var zone_list = obj.GenerateString(0,0);
	obj.ClearAll();
  
   var prefix = "(SELECT COUNT(*) FROM visits AS V WHERE V.COMPANYID='"+company_id+"' AND ";

   cond = ""
   if(team=='') {
      cond3 = "DATE BETWEEN '"+datefrom+"' AND '"+dateto+"'";
      cond  =  " V.TEAM=visits.TEAM AND DATE BETWEEN '"+datefrom+"' AND '"+dateto+"'"
      }
   else {
      cond3 = "TEAM='"+team+"' AND DATE BETWEEN '"+datefrom+"' AND '"+dateto+"'";
      cond += "TEAM='"+team+"' AND DATE=visits.DATE";
      }
	cond  += " AND ZONE IN ("+zone_list+"'')";
   var cond2 = " (ISNULL(V.RESULT,'')='竣工' OR ISNULL(V.RESULT,'')='障礙' OR ISNULL(V.RESULT,'')='修復') ";

   obj.Open("SELECT COUNT(*) AS T FROM VISITS AS V WHERE "+cond2+" AND JOBTYPE=0 AND "+cond3+" AND ZONE IN ("+zone_list+"'')");
   var t1 = obj.Field("T");
   obj.Open("SELECT COUNT(*) AS T FROM VISITS AS V WHERE "+cond2+" AND JOBTYPE=1 AND "+cond3+" AND ZONE IN ("+zone_list+"'')");
   var t2 = obj.Field("T");
   obj.Open("SELECT COUNT(*) AS T FROM VISITS AS V WHERE "+cond2+" AND JOBTYPE=6 AND "+cond3+" AND ZONE IN ("+zone_list+"'')");
   var t3 = obj.Field("T");
   obj.Open("SELECT COUNT(*) AS T FROM VISITS AS V WHERE "+cond2+" AND JOBTYPE=5 AND "+cond3+" AND ZONE IN ("+zone_list+"'')");
   var t4 = obj.Field("T");
   obj.Open("SELECT COUNT(*) AS T FROM VISITS AS V WHERE "+cond2+" AND JOBTYPE=2 AND "+cond3+" AND ZONE IN ("+zone_list+"'')");
   var t5 = obj.Field("T");
   obj.Open("SELECT COUNT(*) AS T FROM VISITS AS V WHERE "+cond2+" AND JOBTYPE=4 AND "+cond3+" AND ZONE IN ("+zone_list+"'')");
   var t6 = obj.Field("T");
   obj.Open("SELECT COUNT(*) AS T FROM VISITS AS V WHERE "+cond2+" AND JOBTYPE=3 AND "+cond3+" AND ZONE IN ("+zone_list+"'')");
   var t7 = obj.Field("T");
   obj.Open("SELECT COUNT(*) AS T FROM VISITS AS V WHERE V.RESULT='再派' AND "+cond3+" AND ZONE IN ("+zone_list+"'')");
   var t8 = obj.Field("T");
   obj.Open("SELECT COUNT(*) AS T FROM VISITS AS V WHERE V.RESULT='退件' AND "+cond3+" AND ZONE IN ("+zone_list+"'')");
   var t9 = obj.Field("T");
   obj.Open("SELECT COUNT(*) AS T FROM VISITS AS V WHERE V.RESULT='拆線' AND "+cond3+" AND ZONE IN ("+zone_list+"'')");
   var t10 = obj.Field("T");
   obj.Open("SELECT COUNT(*) AS T FROM VISITS AS V WHERE ISNULL(V.RESULT,'')='' AND JOBTYPE=0 AND "+cond3+" AND ZONE IN ("+zone_list+"'')");
   var t11 = obj.Field("T");
   obj.Open("SELECT COUNT(*) AS T FROM VISITS AS V WHERE ISNULL(V.RESULT,'')='' AND JOBTYPE=1 AND "+cond3+" AND ZONE IN ("+zone_list+"'')");
   var t12 = obj.Field("T");
   obj.Open("SELECT COUNT(*) AS T FROM VISITS AS V WHERE ISNULL(V.RESULT,'')='' AND JOBTYPE=6 AND "+cond3+" AND ZONE IN ("+zone_list+"'')");
   var t13 = obj.Field("T");
   obj.Open("SELECT COUNT(*) AS T FROM VISITS AS V WHERE ISNULL(V.RESULT,'')='' AND JOBTYPE=5 AND "+cond3+" AND ZONE IN ("+zone_list+"'')");
   var t14 = obj.Field("T");
   obj.Open("SELECT COUNT(*) AS T FROM VISITS AS V WHERE ISNULL(V.RESULT,'')='' AND JOBTYPE=2 AND "+cond3+" AND ZONE IN ("+zone_list+"'')");
   var t15 = obj.Field("T");
   obj.Open("SELECT COUNT(*) AS T FROM VISITS AS V WHERE ISNULL(V.RESULT,'')='' AND JOBTYPE=4 AND "+cond3+" AND ZONE IN ("+zone_list+"'')");
   var t16 = obj.Field("T");
   obj.Open("SELECT COUNT(*) AS T FROM VISITS AS V WHERE ISNULL(V.RESULT,'')='' AND JOBTYPE=3 AND "+cond3+" AND ZONE IN ("+zone_list+"'')");
   var t17 = obj.Field("T");
   obj.Open("SELECT COUNT(*) AS T FROM VISITS AS V WHERE ISNULL(V.RESULT,'')='' AND JOBTYPE=7 AND "+cond3+" AND ZONE IN ("+zone_list+"'')");
   var t18 = obj.Field("T");
   obj.Open("SELECT COUNT(*) AS T FROM VISITS AS V WHERE "+cond2+" AND JOBTYPE=7 AND "+cond3+" AND ZONE IN ("+zone_list+"'')");
   var t19 = obj.Field("T");


%>   
<tr bgcolor="#BBCCDD" style="text-align:center;">
<td>合計</td>
<td></td>
<td><%=t1%></td><td><%=t2%></td><td><%=t3%></td><td><%=t4%></td><td><%=t19%></td><td><%=t5%></td><td><%=t6%></td><td><%=t7%></td>
<td><%=t8%></td>
<td><%=t9%></td>
<td><%=t10%></td>
<td><%=t11%></td><td><%=t12%></td><td><%=t13%></td><td><%=t14%></td><td><%=t18%></td><td><%=t15%></td><td><%=t16%></td><td><%=t17%></td>
</tr>
</tr>
<%   
   
	var str = prefix + cond+") AS TA,"
	+ prefix + "ISNULL(V.RESULT,'')!='拆線' AND "+ cond+") AS TOTAL," // - " + prefix + "ISNULL(V.RESULT,'')='拆線' AND "+cond+")
	+ prefix + "ISNULL(V.RESULT,'')='再派' AND "+cond+") AS TC,"
	+ prefix + "ISNULL(V.RESULT,'')='退件' AND "+cond+") AS TD,"
	+ prefix + "ISNULL(V.RESULT,'')='拆線' AND "+cond+") AS TE,"
	+ prefix + cond2 + "AND "+cond+" AND JOBTYPE=0) AS TGA,"
	+ prefix + cond2 + "AND "+cond+" AND JOBTYPE=1) AS TGB,"
	+ prefix + cond2 + "AND "+cond+" AND JOBTYPE=5) AS TGC,"
	+ prefix + cond2 + "AND "+cond+" AND JOBTYPE=2) AS TGD,"
	+ prefix + cond2 + "AND "+cond+" AND JOBTYPE=4) AS TGE,"
	+ prefix + cond2 + "AND "+cond+" AND JOBTYPE=6) AS TGF,"
	+ prefix + cond2 + "AND "+cond+" AND JOBTYPE=7) AS TGH,"
	+ prefix + cond2 + "AND "+cond+" AND JOBTYPE=3) AS TGG,"
	+ prefix + "ISNULL(V.RESULT,'')='' AND "+cond+" AND JOBTYPE=0) AS TFA,"
	+ prefix + "ISNULL(V.RESULT,'')='' AND "+cond+" AND JOBTYPE=1) AS TFB,"
	+ prefix + "ISNULL(V.RESULT,'')='' AND "+cond+" AND JOBTYPE=5) AS TFC,"
	+ prefix + "ISNULL(V.RESULT,'')='' AND "+cond+" AND JOBTYPE=2) AS TFD,"
	+ prefix + "ISNULL(V.RESULT,'')='' AND "+cond+" AND JOBTYPE=4) AS TFE,"
	+ prefix + "ISNULL(V.RESULT,'')='' AND "+cond+" AND JOBTYPE=6) AS TFF,"
	+ prefix + "ISNULL(V.RESULT,'')='' AND "+cond+" AND JOBTYPE=7) AS TFH,"
	+ prefix + "ISNULL(V.RESULT,'')='' AND "+cond+" AND JOBTYPE=3) AS TFG";

	if(team=='')
      obj.NewQuery("SELECT visits.TEAM AS WHAT, "+str+" FROM visits WHERE COMPANYID='"+company_id+"' GROUP BY TEAM ORDER BY TEAM");
   else
      obj.NewQuery("SELECT visits.DATE AS WHAT, "+str+" FROM visits WHERE COMPANYID='"+company_id+"' AND DATE BETWEEN '"+datefrom+"' AND '"+dateto+"' GROUP BY DATE ORDER BY DATE");
         
	obj.NewTemplate(SitePath+"search\\s10.wet");

	obj.DirectResponse = 1;
	obj.Generate(0,0);
%>
</table>
<%
      }
%>
