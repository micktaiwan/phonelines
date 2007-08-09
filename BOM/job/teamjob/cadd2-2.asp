<%
   var itemcode = String(Request("ITEM"));
   var iid = "";
   if(itemcode=="undefined") iid = GetSession("TEAMJOBADD2ITEMID");
   //Response.Write("iid="+iid + " code="+itemcode)
   if(iid == "" || iid=="undefined") {
      obj.ClearAll();
      obj.NewQuery("SELECT ID FROM BOMITEMS WHERE ITEM='"+itemcode+"'");
      obj.NewTemplate(MMSitePath+"id.wet");
      iid = obj.GenerateString(0,0);
      }
   //Response.Write("iid="+iid + " code="+itemcode)
   if(iid=="") {%>
      <strong>項次錯誤</strong><br><%
      }
   else {
      Session("TEAMJOBADD2ITEMID") = iid;%>
      <style>
      .abc {
         border:1px solid #DDCCBB;
         background-color:#FFEEDD;
         }
      </style>
      <form name="addform" action="bom/job/teamjob/add2.asp" method="post">
      <table border="0" cellspacing="2" cellpadding="1"><%
         obj.ClearAll();
         obj.NewQuery("SELECT CODE, SUBJECT, UNIT, POINTS FROM BOMITEMS WHERE id='"+iid+"'");
         obj.NewTemplate(SitePath+"BOM/job/teamjob/add2-2.wet");
         obj.Generate(0,0);%>
      <tr><td>數量:</td><td><input type="text" name="QTY" value=""></td></tr>
      <tr><td>加減點代號:</td><td><input type="text" name="ASCODE" value=""></td></tr>
      <tr><td>&nbsp;</td><td><input class="button" type="button" onclick="submitaddform3();" value="增加"></td></tr>
      </table>
      </form><%
      }
%>
<!--#include file="ctree.asp"-->