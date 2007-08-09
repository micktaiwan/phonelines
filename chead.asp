<%
   if(company_id==0) {
%>
<head>
   <meta http-equiv="Content-Type" content="text/html; charset=big5">
   <meta name="Author" content="Artemas (Art Design), Mickael mickael@easyplay.com.tw (Programmation)">
   <meta http-equiv="Keywords" content="phone, line, hinet, install, easyplay">
   <meta http-equiv="Description" content="Taiwan Phone Line Installation Management System">
   <meta http-equiv='Cache-Control' content='no-cache, must-revalidate'>
   <meta http-equiv='Pragma' content='no-cache'>
   <title>台灣電話線安裝管理系統</title>
   <link REL=STYLESHEET HREF="styles.css" TYPE="text/css">
   <script src="formcheck.js"        type="text/javascript"></script>
   <script src="js/prototype.js"     type="text/javascript"></script>
   <script src="js/scriptaculous.js" type="text/javascript"></script>
   <script src="forside.js"          type="text/javascript"></script>
	<script src="js/majax.js"         type="text/javascript"></script>
	<script>
      var majax = new Majax();
      majax.setBaseUrl("http://192.168.0.6/PhoneSystem/");
      //majax.setBaseUrl("http://phones.easyplay.com.tw/");
   </script>
</head>
<%
   }
   else if(company_id==1) {
%>
<head>
   <meta http-equiv="Content-Type" content="text/html; charset=big5">
   <meta name="Author" content="Artemas (Art Design), Mickael mickael@easyplay.com.tw (Programmation)">
   <meta http-equiv="Keywords" content="phone, line, hinet, install, easyplay">
   <meta http-equiv="Description" content="Taiwan Phone Line Installation Management System">
   <meta http-equiv='Cache-Control' content='no-cache, must-revalidate'>
   <meta http-equiv='Pragma' content='no-cache'>
   <title>台灣電話線安裝管理系統</title>
   <link REL=STYLESHEET HREF="styles.css" TYPE="text/css">
   <script src="formcheck.js"        type="text/javascript"></script>
   <script src="js/prototype.js"     type="text/javascript"></script>
   <script src="js/scriptaculous.js" type="text/javascript"></script>
   <script src="forside.js"          type="text/javascript"></script>
	<script src="js/majax.js"         type="text/javascript"></script>
	<script>
      var majax = new Majax();
      majax.setBaseUrl("http://192.168.0.6/PhoneSystem/");
      //majax.setBaseUrl("http://phones.easyplay.com.tw/");
   </script>
</head>
<%
   }
%>
