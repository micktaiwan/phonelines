<%
   var bom  = String(Request("bom"));
   var canseebom  = GetSession("PHONEBOM")*1;
   var p    = String(Request("P"));
   var sp   = String(Request("SP"));
   var sp2  = String(Request("SP2"));

   var ip = Request.ServerVariables("REMOTE_ADDR");
   var id = GetSession("PHONEID");
   var qs = String(Request.ServerVariables("QUERY_STRING"));
   var admin = GetSession("PHONEADMIN");
   var company_id = GetSession("PHONECOMPANYID")

   Session("PHONEQS") = qs;
%>
