<%
   obj.ClearAll();
   obj.DirectResponse = 1;
   obj.NewQuery("SELECT COUNT(*) AS ID FROM BOMTEAMJOB");
   obj.NewTemplate(SitePath + "id.wet");
   var count = parseInt(obj.GenerateString(0,0));
   Response.Write(String(count) + " records");

if(count>0) {
   var x = String(Request("X"));
   if(x == "undefined") x = GetSession("BOMTEAMJOBX");
   if(x == "undefined") x = 1;
   Session("BOMTEAMJOBX") = x;
   x = parseInt(x);
   var nb = 50;
   var z = nb;
   var y = x + (z-1);
   if(y > count) {
      y = count;
      z = (y-x)+1;
      }

   var nbpages = Math.ceil(count / nb);
   var menu = "";
   if(nbpages > 1) {
      Response.Write("<br>" + String(x)+" - "+y+" ");
      var common = "<a href=\"l.asp?bom=1&P=teamjob";
      common +=  "&X=";
      if(x-z > 0 )
         menu += "<a href=\""+common+"&X="+(x-nb)+"\"><img src=\"images/prev.gif\" border=\"0\"></a> ";
      else
         menu += "<img src=\"images/prev2.gif\" border=\"0\"> ";

      for(i=0; i < nbpages; i++)
         if(x==(i*nb)+1) menu += "<u>" + (i+1) + "</u> ";
         else menu += "<a href=\""+common+"&X="+((i*nb)+1)+"\">" + (i+1) + "</a> ";

      if(y < count)
         menu += "<a href=\""+common+"&X="+(x+z)+"\"><img src=\"images/next.gif\" border=\"0\"></a>";
      else
         menu += "<img src=\"images/next2.gif\" border=\"0\">";
      } // pages > 1
   if(menu!="") Response.Write(menu+"<br>");
%>

<table cellspacing="1" cellpadding="2" bgcolor="#555500">
<tr bgcolor="#DDDDD0">
<td></td>
<td>班別</td>
<td>日期</td>
<td>工程編號</td>
<td>工作單號</td>
<td>圖號</td>
<td>類別</td>
<td>財產別</td>
<td>料別</td>
<td>工作項目代號</td>
<td>工作項目</td>
<td>數量</td>
<td>加減點代號</td>
<td>材料代號</td>
<td>材料名稱</td>
<td>實用數量</td>
<td>餘長</td>
<td>損耗</td>
<td></td>
</tr>
<%
      obj.ClearAll();
      obj.NewQuery("SELECT * FROM (SELECT TOP "+z+" * FROM \
         (SELECT TOP "+y+" bomteamjob.*, bomdata.IDNUMBER AS WORKCODE, bomjob.JOBCODE, \
            BOMITEMS.ITEM AS SUBJECTITEM, BOMITEMS.SUBJECT, BOMASCODE.CODE AS ASCODE, bommaterial.CODE AS MATCODE, \
            bommaterial.NAME AS MATNAME \
         FROM BOMTEAMJOB \
         LEFT OUTER JOIN BOMJOB ON bomjob.ID=bomteamjob.JOBID \
         LEFT OUTER JOIN BOMDATA ON BOMDATA.ID=bomteamjob.WORKID \
         LEFT OUTER JOIN BOMITEMS ON BOMITEMS.ID=bomteamjob.SUBJECTID \
         LEFT OUTER JOIN BOMASCODE ON BOMASCODE.ID=bomteamjob.ASID \
         LEFT OUTER JOIN BOMMATERIAL ON BOMMATERIAL.ID=bomteamjob.MATID \
         ORDER BY bomteamjob.ID DESC) T1  ORDER BY ID ASC) T2 ORDER BY ID DESC");
      obj.NewTemplate(SitePath+"bom\\job\\teamjob\\tree.wet");
      obj.DirectResponse = 1;
      obj.Generate(0,0);
%>
</table>
<%
   if(menu!="") Response.Write(menu+"<br>");
   }
%>