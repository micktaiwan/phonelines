<%@ language="javascript" %>
<!--#include file="../../init.asp"-->
<!--#include file="../../virtual.asp"-->
<!--#include file="../../func.asp"-->
<%
   // search the record
   var team = String(Request("TEAM"));
   //Response.Write(team+"<br>");
   var date = String(Request("DATE"));

   var phone = String(Request("PHONE"));
   var result = String(Request("RESULT"));
   var repairdate = String(Request("REPAIRDATE"));
   var reason = und(String(Request("REASON")));
   var memo = String(Request("MEMO"));

   Session("editresultteam") = team;
   Session("editresultdate") = date;


   var obj = Server.CreateObject("MATech.Engine");
   obj.SetDB(DB,"sa","engine");

   var cond1 = "";
   if(GetSession("PHONEADMIN")=="3") cond1 = " AND visits.ZONE IN (SELECT CODE FROM zones JOIN repzones ON zones.ID=repzones.ZONE WHERE repzones.REP="+GetSession("PHONEID")+")";


   if(result=="�״_")
      obj.NewQuery("SELECT TOP 1 ID FROM VISITS WHERE phone='"+phone+"' AND ISNULL(RESULT,'')!='"+result+"'"+cond1+" AND COMPANYID='"+company_id+"'");
   else {
     if(date=="undefined") {
         Response.Write("���U�w�q�����");
         obj = "";
         Response.End();
         }
      if(team != "undefined") obj.NewQuery("SELECT TOP 1 ID FROM VISITS WHERE team='"+team+"' AND DATE='"+date+"' AND phone='"+phone+"' AND ISNULL(RESULT,'')!='"+result+"'"+cond1+" AND COMPANYID='"+company_id+"'");
      else obj.NewQuery("SELECT TOP 1 ID FROM VISITS WHERE phone='"+phone+"' AND DATE='"+date+"' AND ISNULL(RESULT,'')!='"+result+"'"+cond1+" AND COMPANYID='"+company_id+"'");
      }
   obj.NewTemplate(SitePath+"id.wet");

   var id =  obj.GenerateString(0,0);
   //obj.Generate(0,0);
   //obj = "";
   //Response.End();
   var nb = 0;
   if(id=="") {
      Response.Write("<strong>���~</strong>: �䤣��O�� (�q��:"+phone+")");
      obj = "";
      Response.End();
      }
   while(id!="") {
      //Response.Write(id+"<br>");
      //obj.ClearAll();
      if(result=="���u") {
         // Verify if the result was not already ��u (a ��u can not be transformed in ���u)
         obj.Open("SELECT RESULT FROM VISITS WHERE ID="+id);
         var r = obj.Field("RESULT");
         if(r=="��u") {
            obj = "";
            Response.Write("�w��u���i�b���u���ɿ�J");
            Response.End();
            }
         }
      if(memo!="undefined") {
         obj.Execute("UPDATE VISITS SET RESULT='"+result+"', REASON='"+reason+"', memo='"+memo+"' WHERE ID="+id);
         if(result=="�״_") {
            obj.Execute("UPDATE REPAIRLOG SET CORRECTED=1, REPAIRDATE='"+repairdate+"' WHERE VISITID="+id);
            }
         }
      else  obj.Execute("UPDATE VISITS SET RESULT='"+result+"', REASON='"+reason+"' WHERE ID="+id);
      nb++;
      id = obj.GenerateString(0,0);
      }
   obj = "";
   Response.Redirect("../../l.asp?P=visits&SP=result&R="+result+"&E=1&NB="+nb);
%>
