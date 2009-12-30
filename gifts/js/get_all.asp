<%@ language="javascript"%>
<!--#include file="../../virtual.asp"-->
<!--#include file="../../func.asp" -->
<%
// used on the main input page to get all gifts and mat used for the given date, team and phone
// return 2 lists: gifts and mat separated by ";"
// gifts: code,nb,code,nb,...
// mat: code,nb,mat,code,nb,mat,...
// ex: 1,1,2,2;1,1,MAC1,2,2,MAC2

var visitid = String(Request("V"));

var obj = Server.CreateObject("MATech.Engine");

try {
   obj.SetDB(DB,"sa","engine");
   //obj.ClearAll();
   obj.NewQuery("SELECT MAINID, NB FROM giftgiven WHERE visitid='"+visitid+"'");
   obj.NewTemplate(SitePath+"gifts\\give\\all_gifts.wet");
   obj.DirectResponse = 1;
   gifts = obj.GenerateString(0,0);
   if(gifts!="") gifts = gifts.substr(0,trim(gifts).length-1)
   obj.ClearAll();
   obj.NewQuery("SELECT MAINID, NB, MAC FROM matused WHERE visitid='"+visitid+"'");
   obj.NewTemplate(SitePath+"gifts\\give\\all_mats.wet");
   obj.DirectResponse = 1;
   mats = obj.GenerateString(0,0);
   if(mats!="") mats = mats.substr(0,trim(mats).length-1)
   Response.Write(gifts+";"+mats);
   }
catch(e) {
   Response.Write("get_all.asp error: "+escape(String(e)));
   }

obj = "";

%>