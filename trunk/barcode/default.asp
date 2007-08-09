<%@ language="javascript"%>
<HTML>
<HEAD>
<TITLE>Barcode generator</TITLE>
</HEAD>
<style>
BODY {font-family: Arial; font-size: 12pt;}
TABLE {font-family: Arial; font-size: 12pt;}
INPUT {font-family: Arial; font-size: 12pt;}

</style>
</head>
<BODY>
<H3>Barcode image generator</H3>
<%

   var text = String(Request("TEXT"));
   if(text=="undefined") text = "hello";
   var height = String(Request("HEIGHT"));
   if(height=="undefined") height = 24;
   var title = String(Request("TITLE"));
   if(title=="undefined") title = 0;
   var path = text+"_"+height+"_"+title;
%>
<form action="default.asp" method="get">
<table border="0" cellspacing="0" cellpadding="0" style="border:3px dashed #AAAA00;padding:10px;background-color:FFFF77;">
<tr><td>Text: </td><td><input name="TEXT" value="<%=text%>"></td></tr>
<tr><td>Size: </td><td><select name="HEIGHT">
<option value="12">small</option>
<option value="24" selected>normal</option>
<option value="70">big</option>
</select></td></tr>
<tr><td>&nbsp;</td><td><input type="checkbox" name="TITLE" value="1"> Title</td></tr>
<tr><td>&nbsp;</td><td><input type="submit"></td></tr>
</table>
</form>

<%
   var obj = Server.CreateObject("BarCode.Generator");
   obj.Set(100, 20, 2, "*"+text+"*", "3 of 9 Barcode", -height, "D:\\matech\\web\\sites\\phonesystem\\barcode\\images\\"+path+".gif", title);
   obj.Generate();
   obj = "";
%>
<img src="images/<%=path%>.gif">
</BODY>
</HTML>