<%@ language="javascript"%>
<!--#include file="../virtual.asp" -->
<!--#include file="../func.asp" -->
<%
   if(!IsLogged("PHONE") || GetSession("PHONEADMIN") == "0") Response.End();

   var obj = Server.CreateObject("MATech.Engine");
   obj.SetDB(DB,"sa","engine");

   var k = String(Request("K"));
   obj.ClearAll();
   obj.NewQuery("SELECT smshnid AS ID FROM SMS WHERE ID="+k);
   obj.NewQuery("SELECT PHONE AS ID FROM SMS WHERE ID="+k);
   obj.NewQuery("SELECT msgid AS ID FROM SMS WHERE ID="+k);
   obj.NewQuery("SELECT TYPE AS ID FROM SMS WHERE ID="+k);
   obj.NewTemplate(SitePath+"id.wet");
   var type = obj.GenerateString(3,0);
   var smshnid;
   if(type=="0") {
      smshnid = obj.GenerateString(0,0);
      }
   else {
      smshnid = -1;
      }
   var phone   = obj.GenerateString(1,0);
   var msgid   = obj.GenerateString(2,0);
   if(smshnid == "") {
      obj = "";
      Response.Write("Can't get smshnid");
      Response.End();
      }
   if(smshnid == "0") {
      obj = "";
      Response.Write("Incompatible record");
      Response.End();
      }

   if(type=="0") {
      obj.ClearAll();
      obj.NewQuery("SELECT HN AS ID FROM SMSHN WHERE ID="+smshnid);
      obj.NewQuery("SELECT PASS AS ID FROM SMSHN WHERE ID="+smshnid);
      obj.NewTemplate(SitePath + "id.wet");
      var login = obj.GenerateString(0,0);
      var pass = obj.GenerateString(1,0);
      if(login == "" || pass == "") {
         obj = "";
         Response.Write("Can't get login or pass");
         Response.End();
         }
      }
   else {
      login = "84542930";
      pass  = "2agirrdl";
      }


   var sms = Server.CreateObject("MATechSMS.SMS");
   sms.Login      = login;
   sms.Password   = pass;
   result = sms.Track(phone,msgid);
   if(result==0) { //SUCCESS
      obj.Execute("UPDATE SMS SET LASTTRACKDATE=getdate(), tracking="+sms.RetCode+",TRACKMSG='"+sms.RetDescription+"' WHERE ID="+k);
      }
   else {
      obj.Execute("UPDATE SMS SET LASTTRACKDATE=getdate(), tracking=-1,TRACKMSG='"+sms.RetDescription+"' WHERE ID="+k);
      }
   sms = "";
   obj = "";
   Response.Redirect("../l.asp?P=sms&D#msg");
%>
