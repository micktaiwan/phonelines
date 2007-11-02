
<%
   obj.ClearAll();
   obj.DirectResponse = 1;
   obj.NewQuery("SELECT *, DATEDIFF(day,CAST(CAST(calendar.YEAR AS VARCHAR(4)) + '/' + CAST(calendar.MONTH AS VARCHAR(2)) + '/' + CAST(calendar.DAY AS VARCHAR(2)) AS DATETIME), GETDATE()) AS OLD, CAST(TITLE AS VARCHAR(16))+'...' AS RES FROM calendar WHERE MEMBERID='"+id+"' OR (COMPANYID='"+company_id+"' AND PUB=1)");
   obj.NewTemplate(SitePath+"calendar\\tree.wet");
   obj.GenerateFile(0,0,SitePath+"calendar\\events\\"+id+".js"); // GetSession("ORGANID")
%>

    <script language="JavaScript" src="calendar/dhtmlcal.js"></script>
    <script language="JavaScript" src="calendar/events/<%=id%>.js"></script>

    <script language="JavaScript">
    DHTMLCal_Form();
    </script>

    <div id="CALDIV">
    <ilayer name="ALIGN">
    <layer name="CALLAYER">

    <script language="JavaScript">
    DHTMLCal_Update();
    </script>

    </layer>
    </ilayer>
    </div>
