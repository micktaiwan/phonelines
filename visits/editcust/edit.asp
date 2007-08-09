<%@ language="javascript"%>
<!--#include file="../../init.asp"-->
<!--#include file="../../virtual.asp"-->
<!--#include file="../../func.asp"-->
<%
   var obj = Server.CreateObject("MATech.Engine");
   obj.SetDB(DB,"sa","engine");

   // search the record
   var team = String(Request("TEAM"));
   var date = String(Request("DATE"));
   var phone = String(Request("PHONE"));

   Session("custDATE") = date;
   Session("custTEAM") = team;

   var cond1 = "";
   if(GetSession("PHONEADMIN")=="3") cond1 = " AND visits.ZONE IN (SELECT CODE FROM zones JOIN repzones ON zones.ID=repzones.ZONE WHERE repzones.REP="+GetSession("PHONEID")+")";
   
   obj.Open("SELECT TOP 1 ID FROM VISITS WHERE team='"+team+"' AND date='"+date+"' AND phone='"+phone+"'"+cond1+" AND COMPANYID='"+company_id+"'");
   var id = obj.Field("ID");
   //Response.Write(id);
   if(id=="") {
      obj = "";
      Response.Write("Can not find the record");
      Response.End();
      }
   
   var name = String(Request("custname"));
   var address = String(Request("custaddress"));
   var contactname = String(Request("contactname"));
   var contactphone = String(Request("contactphone"));

   //obj.ClearAll();
   obj.Execute("UPDATE VISITS SET CUSTNAME='"+name+"', CUSTADDRESS='"+address+"', CONTACTNAME='"+contactname+"',  CONTACTPHONE='"+contactphone+"'  WHERE ID="+id);

   obj = "";
   Response.Redirect("../../l.asp?P=visits&SP=cust&E=1");   
%>
