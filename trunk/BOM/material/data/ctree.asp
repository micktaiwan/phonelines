<%
   obj.ClearAll();
   obj.DirectResponse = 1;
   obj.NewQuery("SELECT COUNT(*) AS ID FROM BOMMATERIAL");
   obj.NewTemplate(SitePath + "id.wet");
   var count = parseInt(obj.GenerateString(0,0));
   Response.Write(String(count) + "個材料");

if(count>0) {
   var x = String(Request("X"));
   if(x == "undefined") x = 1;
   Session("BOMMATX") = x;
   x = parseInt(x);
   var nb = 100;
   var z = nb;
   var y = x + (z-1);
   if(y > count) {
      y = count;
      z = (y-x)+1;
      }
   Response.Write("<br>" + String(x)+" - "+y+" ");
   var common = "<a href=\"l.asp?bom=1&P=mdata";
   common +=  "&X=";
   var previous = common +(x-nb)+"\">";
   var next = common +(x+z)+"\">";

   Response.Write("[");
   if(x-z > 0 ) Response.Write(previous);
   Response.Write("上一頁</a>] ");
   Response.Write("[");
   if(y < count) Response.Write(next);
   Response.Write("下一頁</a>]");
%>
<!--
<table cellspacing="1" cellpadding="2" bgcolor="#555500">
<tr bgcolor="#DDDDD0">
<td></td>
<td>材料代碼</td>
<td>局料代碼</td>
<td>檢碼</td>
<td>材料名稱</td>
<td>單位</td>
<td></td>
</tr>
<%
      obj.ClearAll();
      obj.NewQuery("SELECT * FROM (SELECT TOP "+z+" * FROM (SELECT TOP "+y+" *, \
         (SELECT COUNT(*) FROM BOMMATERIAL AS T WHERE T.CODE=bommaterial.CODE) AS CA, \
         (SELECT COUNT(*) FROM BOMMATERIAL AS T WHERE T.SUPPLIER=bommaterial.SUPPLIER) AS CB \
         from BOMMATERIAL \
         WHERE LEN(SUPPLIER)!=8 ORDER BY CODE ASC) T1  ORDER BY CODE DESC) T2 ORDER BY CODE ASC");
      obj.NewTemplate(SitePath+"bom\\material\\data\\tree.wet");
      obj.DirectResponse = 1;
      //obj.Generate(0,0);
%>
</table>
<br>
-->
<table cellspacing="1" cellpadding="2" bgcolor="#555500">
<tr bgcolor="#DDDDD0">
<td></td>
<td>材料代碼</td>
<td>局料代碼</td>
<td>檢碼</td>
<td>材料名稱</td>
<td>單位</td>
<td></td>
</tr>
<%
      obj.ClearAll();
      obj.NewQuery("SELECT * FROM (SELECT TOP "+z+" * FROM (SELECT TOP "+y+" *, \
         (SELECT COUNT(*) FROM BOMMATERIAL AS T WHERE T.CODE=bommaterial.CODE) AS CA, \
         (SELECT COUNT(*) FROM BOMMATERIAL AS T WHERE T.SUPPLIER=bommaterial.SUPPLIER) AS CB \
         from BOMMATERIAL \
         ORDER BY CODE ASC) T1  ORDER BY CODE DESC) T2 ORDER BY CODE ASC");
      obj.NewTemplate(SitePath+"bom\\material\\data\\tree.wet");
      obj.DirectResponse = 1;
      obj.Generate(0,0);
%>
</table>
<%
   }
%>
