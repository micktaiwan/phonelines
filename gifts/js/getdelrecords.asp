<%@ language="javascript"%>
<!--#include file="../../virtual.asp"-->
<!--#include file="../../func.asp" -->
<%
   var date = String(Request("D"));
   var team = String(Request("T"));
   var phone = String(Request("P"));
   var obj = Server.CreateObject("MATech.Engine");
   obj.SetDB(DB,"sa","engine");

   var rv = "<table id=\"gifttable\" cellspacing=1 cellpadding=2 bgcolor='black'>";
   rv += "<tr bgcolor='#AABBCC' style='text-align:center;'>";
   rv += "<td>�a��</td>";
   rv += "<td>���</td>";
   rv += "<td>�Z�O</td>";
   rv += "<td>�q�ܸ��X</td>";
   rv += "<td>�p�渹�X</td>";
   rv += "<td>���G</td>";
   rv += "</tr>";
   obj.NewQuery("SELECT ID FROM VISITS WHERE team='"+team+"' AND DATE='"+date+"' AND phone='"+phone+"'");
   obj.NewTemplate(SitePath+"gifts\\search\\delids.wet");
   var list = obj.GenerateString(0,0);
   obj.ClearAll();
   obj.NewQuery("SELECT ID, ZONE, DATE, TEAM, PHONE, SERIAL, RESULT FROM VISITS WHERE team='"+team+"' AND DATE='"+date+"' AND phone='"+phone+"'");
   obj.NewTemplate(SitePath+"gifts\\give\\tree.wet");
   rv += obj.GenerateString(0,0);
	rv += "</table>";
   rv += "�нT�w�O�_�n�R���A�p���yok�z�@�g�T�{�h��ƻݭ��s��J<br>";
	rv += "<input class=\"button\" type=\"button\" onclick=\"delconfirmed('"+list+"')\" value=\"       OK       \">";
		
   Response.Write(escape(rv));

   obj = "";
%>
