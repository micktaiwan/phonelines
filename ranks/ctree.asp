<table bgcolor="#AAAAA0" cellspacing="1" cellpadding="3">
<tr style="font-weight:bold;" bgcolor="#DDDDD0">
<td>班別</td>
<td>姓名</td>
<td>派工</td>
<td>竣工</td>
<td>退件</td>
<td>再派</td>
<td>障礙</td>
<td>隔日</td>
<td>拆線</td>
<td>註銷</td>
<td>竣工率</td>
<td>排名</td>
<td>障礙率</td>
<td>排名</td>
</tr>
<%

var date1 = "2003/11/01";
var date2 = "2003/12/01";


obj.ClearAll();
obj.NewQuery("SELECT TEAM AS ID FROM PERSONNEL WHERE ISNULL(DEPARTURE,'')='' ORDER BY TEAM");
obj.NewTemplate(MMSitePath+"list.wet");
var teams = obj.GenerateString(0,0).split(",");

for(i=0; i < teams.length; i++) {
   if(teams[i]=="") continue;
   Response.Write(teams[i]+": ");
   obj.Open("SELECT COUNT(*) AS PAI FROM VISITS WHERE TEAM='"+teams[i]+"' AND RESULT='竣工' AND DATE BETWEEN '"+date1+"' AND '"+date2+"'");
   var pai = obj.Field("PAI");
   Response.Write(pai+"<br>");
   }


obj.ClearAll();
obj.NewQuery("SELECT TEAM, NAME, "+pai+" FROM PERSONNEL WHERE ISNULL(DEPARTURE,'')='' ORDER BY NAME");
obj.NewTemplate(SitePath+"ranks/tree.wet");
//obj.Generate(0,0);
%>
</table>
