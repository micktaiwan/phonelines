<%@ language="javascript"%>
<!--#include file="../init.asp"-->
<!--#include file="../func.asp"-->
<!--#include file="../virtual.asp"-->
<%
var previous_text = "<img src='images/prev.gif' border=0> Prev";
var next_text 		= "Next <img src='images/next.gif' border=0>";

function create_pagination_sql(table,fields,where,order,page,limit) {
	return "select * from (select top "+limit+" * from (select top "+(page*limit+limit)+" "+fields+" from "+table+" "+where+" order by "+table+"."+order+" desc) T1 order by "+order+" asc) T2 order by "+order+" desc";
	}
function create_pagination_index(cur, tot, limit) {
	// cur = current page
	// tot = nbr of total record (not pages)
	// limit: nbr of records by page
	cur = parseInt(cur)
	str = "";
	prev = previous_text;
	nxt  = next_text;
	if(cur >= 1)   prev 	= "<a href='#' onclick='get_page("+(cur-1)+");return false;'>"+previous_text+"</a>"
	if(cur < tot/limit-1) nxt 	= "<a href='#' onclick='get_page("+(cur+1)+");return false;'>"+next_text+"</a>"
	str += prev;
	str += "  "
	str += nxt;
	return str;
	}
	
%>
<table width="100%" bgcolor="#AAAAA0" cellpadding="2" cellspacing="1">
<tr bgcolor="#DDDDD0" style="font-weight:bold;">
<td>Title</td><td>Name</td><td>Date</td><td width="20"></td><td width="20"></td>
</tr>
<%
   var obj = Server.CreateObject("MATech.Engine");
   obj.SetDB(DB,"sa","engine");
   obj.Open("SELECT COUNT(*) AS C FROM info where COMPANYID='"+company_id+"'");
   var total_records = obj.Field("C");
   var record_per_page = 20;
	var current_page = und(String(Request("X")));
	
   obj.ClearAll();
	sql = create_pagination_sql("info","info.*, reporters.name","LEFT OUTER JOIN REPORTERS ON REPORTERS.ID=INFO.MEMBERID where info.COMPANYID='"+company_id+"'", "id",current_page, record_per_page);
	obj.NewQuery(sql);
   obj.NewTemplate(SitePath+"info\\editl.wet");
   Response.Write(escape(obj.GenerateString(0,0)));
%>
</table>
<br/>
<%= create_pagination_index(current_page, total_records, record_per_page) %>
