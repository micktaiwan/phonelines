<%
   obj.ClearAll();
   obj.DirectResponse = 1;
   obj.NewQuery("SELECT COUNT(*) AS ID FROM BOMITEMS");
   obj.NewTemplate(SitePath + "id.wet");
   var count = parseInt(obj.GenerateString(0,0));
   Response.Write(String(count) + "�Ӷ���");

if(count>0) {
   var x = String(Request("X"));
   if(x == "undefined") x = 1;
   x = parseInt(x);
   var nb = 100;
   var z = nb;
   var y = x + (z-1);
   if(y > count) {
      y = count;
      z = (y-x)+1;
      }

   Response.Write("<br>" + String(x)+" - "+y+" ");
   var common = "<a href=\"l.asp?bom=1&P=items";
   common +=  "&X=";
   var previous = common +(x-nb)+"\">";
   var next = common +(x+z)+"\">";

   Response.Write("[");
   if(x-z > 0 ) Response.Write(previous);
   Response.Write("�W�@��</a>] ");
   Response.Write("[");
   if(y < count) Response.Write(next);
   Response.Write("�U�@��</a>]");
%>

<table cellspacing="1" cellpadding="2" bgcolor="#555500">
<tr bgcolor="#DDDDD0">
<td></td>
<td>����</td>
<td>�����N��</td>
<td>�u�@����</td>
<td>�n�I���</td>
<td>���</td>
<td>���n�I</td>
<td></td>
</tr>


<%
      obj.ClearAll();
      obj.NewQuery("SELECT * FROM (SELECT TOP "+z+" * FROM (SELECT TOP "+y+" * from BOMITEMS ORDER BY ITEM ASC) T1 ORDER BY ITEM DESC) T2 ORDER BY ITEM ASC");
      obj.NewTemplate(SitePath+"bom\\work\\items\\tree.wet");
      obj.DirectResponse = 1;
      obj.Generate(0,0);
%>
</table>

<%
   }
%>
