<%@ language="javascript"%>
<!--#include file="../virtual.asp" -->
<!--#include file="../func.asp" -->
<!--#include file="../repairlog/smslog/functions.asp" -->
<%
   if(!IsLogged("PHONE") || GetSession("PHONEADMIN") == "0") Response.End();

   var obj = Server.CreateObject("MATech.Engine");
   obj.SetDB(DB,"sa","engine");

   var k = String(Request("K"));
   obj.ClearAll();
   obj.Open("SELECT smshnid, phone, msgid, type FROM SMS WHERE ID="+k);
   var type = obj.Field("type");
   var smshnid;
   if(type=="0") {
      smshnid = obj.Field("smshnid");
      }
   else {
      smshnid = -1;
      }
   var phone   = obj.Field("phone");
   var msgid   = obj.Field("msgid");
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
      obj.Open("SELECT HN, PASS FROM SMSHN WHERE ID="+smshnid);
      var login = obj.Field("hn");
      var pass = obj.Field("pass");
      if(login == "" || pass == "") {
         obj = "";
         Response.Write("Can't get login or pass");
         Response.End();
         }
      }
   else {
      login = "73305139";
      pass  = "92f0d6ba";
      }

   var sms = Server.CreateObject("HiAir.HinetSMS");
   var result = sms.StartCon("api.hiair.hinet.net",8000,login,pass)
   if(result != 0) {
      Response.Write("<strong>Error</strong>: "+ConnectErrorToText(result));
      Stop();
      }

   msg = sms.QueryMsg(msgid);
   obj.Execute("UPDATE SMS SET LASTTRACKDATE=getdate(), tracking="+msg+",TRACKMSG='"+TrackMessage(msg)+"' WHERE ID="+k);

   sms.EndCon();
   sms = "";
   obj = "";
   Response.Redirect("../l.asp?P=sms&D#msg");
%>
