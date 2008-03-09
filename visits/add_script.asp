<%
var e = String(Request("E"));
if(e=="1") Response.Write("<font color=red><b>OK</b></font><br>");
if(e=="2") Response.Write("<font size=4 color=red><strong>錯誤: 日期和電話重複</strong></font><br>");

var resp = und(GetSession("resp"));
if(resp=="") resp = GetSession("PHONECODE")
var date = GetSession("date");
if(date == "undefined") date = MyNow(0);
var zone = und(GetSession("zone"));
var team = und(GetSession("team"));
//var ampm = und(GetSession("ampm"));

/*
      obj.ClearAll();
      obj.DirectResponse = 1;
      obj.NewQuery("SELECT COUNT(ID) AS C FROM VISITS WHERE RESPONSIBLE='"+GetSession("PHONECODE")+"'");
      obj.NewTemplate(SitePath+"visits\\stats.wet");
      obj.Generate(0,0);
*/

      obj.ClearAll();
      obj.AddVar(GetSession("PHONEADMIN"));
      
      if(admin!="3")
         obj.NewQuery("SELECT CODE, NAME FROM zones WHERE companyid='"+company_id+"' ORDER BY CODE");
      else
         obj.NewQuery("SELECT repzones.ID, zones.NAME,zones.CODE FROM repzones LEFT OUTER JOIN zones ON zones.ID=repzones.ZONE where repzones.REP="+GetSession("PHONEID")+" ORDER BY zones.CODE");

      obj.NewTemplate(SitePath+"codename2.wet");
      if(admin!="3")
         obj.NewQuery("SELECT TEAM, CODE,NAME FROM personnel where COMPANYID='"+company_id+"' AND personnel.DEPARTURE='' ORDER BY TEAM");
      else
         obj.NewQuery("SELECT repteam.ID, personnel.TEAM, personnel.NAME, personnel.CODE FROM repteam LEFT OUTER JOIN personnel ON personnel.ID=repteam.TEAM where repteam.REP="+GetSession("PHONEID")+"  and personnel.DEPARTURE='' AND personnel.COMPANYID='"+company_id+"' ORDER BY personnel.CODE");
      obj.NewTemplate(SitePath+"codename3.wet");
%>
