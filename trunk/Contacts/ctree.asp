<%
   var det = "�Ӹ`";
   var s = String(Request("S"));
   if(s=="undefined") s = "1";

   var sort;
   switch(s) {
      case "0" : sort = "COMPANY, NAME";break;
      case "1" : sort = "GROUPID DESC,COMPANY,NAME";break;
      case "2" : sort = "NAME";break;
      }
%>
<table BGCOLOR="#000000" cellpadding="3" cellspacing="1">
<tr style="font-weight:bold;" bgcolor="#DDDDDD">
<td><a href="l.asp?P=contacts&S=1">����</a></td>
<td><%=det%></td>
<td><a href="l.asp?P=contacts&S=0">���q</a></td>
<td><a href="l.asp?P=contacts&S=2">�W�r</a></td>
<td>Email</td>
<td>�q��</td>
<td>��}</td>
<td>�R��</td>
</tr>
<%
      obj.ClearAll();
      obj.NewQuery("SELECT *, (SELECT NAME FROM CONTACTGROUPS WHERE ID=contacts.GROUPID) AS GROUPNAME FROM contacts WHERE MEMBERID='"+id+"' OR PUB=1 ORDER BY "+sort);
      obj.NewTemplate(SitePath+"contacts\\tree.wet");
      obj.Generate(0,0);
%>
</table>
