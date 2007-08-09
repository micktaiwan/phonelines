<%@ language="javascript"%>
<!--#include file="../func.asp"-->
<!--#include file="../virtual.asp"-->
<%
	//Response.Write("1");
	if(GetSession("PHONEADMIN")=="0") {
		Response.Write("You can not add records to this database");
		Response.End()
		}

	Session("RESP") = String(Request("RESPONSIBLE"));
	var date = String(Request("DATE"));
	if(date=="undefined") {
	  Response.Write("Date is undefined");
	  Response.End();
	  }
	//Response.Write("2");
	Session("DATE") = date;
	Session("ZONE") = String(Request("ZONE"));
	Session("TEAM") = String(Request("TEAM"));
	Session("AMPM") = String(Request("AMPM"));
	var phone = String(Request("PHONE"));

	var obj = Server.CreateObject("MATech.Engine");
	obj.SetDB(DB,"sa","engine");

	//Response.Write("3");
	obj.NewQuery("SELECT TOP 1 ID FROM VISITS WHERE PHONE='" + phone + "' AND date='" + date + "'");
	obj.NewTemplate(SitePath+"id.wet");
	k = obj.GenerateString(0,0);
	if(k!="") {
		obj = "";
		Response.Write("2");
		Response.End();
		}
	else {
		//obj.Insert("VISITS"); 
		var sql = "INSERT INTO VISITS (RESPONSIBLE, DATE, ZONE, JOBTYPE, TEAM, SERIAL, PHONE, AMPM, COMPANYID) VALUES ('";
		sql += Request("RESPONSIBLE")+"','"+date+"','"+Request("ZONE")+"','"+Request("JOBTYPE")+"','"+Request("TEAM")+"','"+Request("SERIAL")+"','"+Request("PHONE")+"','"+Request("AMPM")+"','"+Request("COMPANYID")+"')";
		obj.Execute(sql);
		}
	obj = "";
	//Response.Redirect(Depth+QS+"visits&SP=add&E=1");
	Response.Write("1");
	Response.End();
%>
