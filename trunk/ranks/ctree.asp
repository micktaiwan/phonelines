<table bgcolor="#AAAAA0" cellspacing="1" cellpadding="3">
<tr style="font-weight:bold;" bgcolor="#DDDDD0">
<td>�Z�O</td>
<td>�m�W</td>
<td>���u</td>
<td>���u</td>
<td>�h��</td>
<td>�A��</td>
<td>��ê</td>
<td>�j��</td>
<td>��u</td>
<td>���P</td>
<td>���u�v</td>
<td>�ƦW</td>
<td>��ê�v</td>
<td>�ƦW</td>
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
   obj.Open("SELECT COUNT(*) AS PAI FROM VISITS WHERE TEAM='"+teams[i]+"' AND RESULT='���u' AND DATE BETWEEN '"+date1+"' AND '"+date2+"'");
   var pai = obj.Field("PAI");
   Response.Write(pai+"<br>");
   }


obj.ClearAll();
obj.NewQuery("SELECT TEAM, NAME, "+pai+" FROM PERSONNEL WHERE ISNULL(DEPARTURE,'')='' ORDER BY NAME");
obj.NewTemplate(SitePath+"ranks/tree.wet");
//obj.Generate(0,0);
%>
</table>
