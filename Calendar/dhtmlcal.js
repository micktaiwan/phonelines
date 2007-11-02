//<!--

//---------------------------------------------------------------------------
//
// File:    DHTMLCal.js
// Version: 1.11
//
// Purpose: This is the source file for the DHTML Calendar
//
//	    This program is shareware
//          If you use this program, please send $25
//          You'll find the address to send to at
//          http://www.geocities.com/dshipe/cadown.htm
//
// Author:  Dan Shipe
//	    312 Druid Oaks Drive
//          Atlanta GA 30329
//          dshipe@writeme.com
//          http://www.geocities.com/dshipe/
//
//    Date     By   Ver   Description
// ----------  ---  ----  ---------------------------------------------------
// 09-01-2000  DS   1.00  Initial creation
// 04-10-2001  DS   1.01  Now supports Netscape 6, Gekko
// 05-30-2001  DS   1.02  Added cookies to track month & year if user "refreshs"
// 07-06-2001  DS   1.03  Fixed bug to set main table border color to mclrBorder
// 07-09-2001  DS   1.04  Added DHTMLCal_PopUp to support event pop-up windows
// 07-10-2001  DS   1.05  Added support to place text in dead cells
// 08-23-2001  DS   1.06  Added inidividual date cell custom colors
// 08-30-2001  DS   1.07  Added booleans to hide Month and Year drop-downs
// 09-04-2001  DS   1.08  Supports "every month" and "every year" dates
// 09-11-2001  DS   1.09  A week may now begin Sunday or Monday
// 11-16-2001  DS   1.10  Added independent active weekend color
// 01-03-2001  DS   1.11  Supports relatively positioned DHTML elements in NS 4.75

//---------------------------------------------------------------------------
// font point size chart
// size 1 	=  8pt
// size 2	= 10pt
// size 3	= 12pt
// size 4	= 14pt
// size 5	= 18pt
// size 6	= 24pt

// ---------------------------------------------------------------------------
var mbBeginMonday = false;	//Adjust the maLongDays array if TRUE
var mbDisplayDeadText = false;
var mbDisplayDeadNumber = false;
var mbDisplayMonthCombo = true;
var mbDisplayYearCombo = true;
var mbWeekendColor = true;

// ---------------------------------------------------------------------------
// initialization

var R = "\r\n";
var Q = "\"";

var mclrBlack =		"#000000";
var mclrWhite =		"#ffffff";
var mclrDeadWhite = 	"#fffffe";
var mclrOffWhite = 	"#e0e0e0";
var mclrLightGray = 	"#c0c0c0";
var mclrNearLightGray =	"#c4c0c1";
var mclrGray =		"#808080";
var mclrYellow =        "#ffe0c0";
var mclrPurple =	"#ff00ff";
var mclrBlue =		"#0000ff";
var mclrRed =		"#ff0000";
var mclrGreen =		"#00ff00";
var mclrPink =		"#ffc0c0";
var mclrLightYellow =	"#ffffc0";
var mclrLightOrange =	"#e0e0c0";
var mclrDarkPurple =	"#800080";
var mclrDarkBlue =	"#000080";
var mclrDarkRed =	"#800000";
var mclrDarkGreen =	"#008000";

// ---------------------------------------------------------------------------
// custom sizes, colors and fonts

var mclrTableBg  = mclrDeadWhite;     // table background DO NOT CHANGE
var mclrDead	 = "#AAAAAA";     // background date cell color - unused this month
var mclrNow	 = mclrLightYellow;   // background date cell color - the current date
var mclrPast	 = mclrOffWhite;      // background date cell color - previous dates
var mclrFuture	 = mclrWhite;         // background date cell color - future dates
var mclrBorder	 = mclrDarkRed;       // border color of calendar
var mclrWeekend	 = mclrNearLightGray; // background date cell color - weekend dates

var mnCellWidth  = 90;               // width of weekday columns and dates
var mnCellHeight = 70;                // height of date cells

// font sizes and colors for the weekday headers (Mon, Tues, Wed...)
var mclrHdrBg	  = "#c04040";
var mclrHdrText	  = mclrWhite;
var mstrHdrFace   = "Arial";
var mstrHdrSize   = "2";

// font sizes and colors for date (1st, 3rd, 15th...)
var mstrNumFace   = "Arial";
var mstrNumSize   = "2";

// font sizes and colors for the event text
var mclrCellText   = mclrBorder;
var mstrCellFace   = "Arial";
var mstrCellSize   = "2";

var maDaysPerMonth = new Array( 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31 );
var maLongMonths   = new Array( "January", "February", "March", "April",
	 		"May", "June", "July", "August",
			"September", "October", "November", "December" );
var maLongDays	   = new Array( "Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat" );

var maYear = new Array();
var maMonth = new Array();
var maDay = new Array();
var maText = new Array();
var maClrText = new Array();
var maClrBack = new Array();

var mstrBrowserName = DHTMLCal_BrowserName();
var mstrBrowserVer = DHTMLCal_BrowserVer();

// ---------------------------------------------------------------------------------------
function DHTMLCal_SetEvent( m, d, y, strText, strClrText, strClrBack) {
	var x = maDay.length;

	maYear[x +1]   = y;
	maMonth[x + 1] = m;
	maDay[x + 1]   = d;
	maText[x + 1]  = strText;
	if ( strClrText != null ) maClrText[x + 1]  = strClrText;
	if ( strClrBack != null ) maClrBack[x + 1]  = strClrBack;
}

// ---------------------------------------------------------------------------------------
function DHTMLCal_GetEvent( m, d, y, strOption) {
	var x = 0;

	var rv = "";
	while( x < maDay.length ) {
		if (
		( y == maYear[x] || maYear[x] == null )
		&& ( m + 1 == maMonth[x] || maMonth[x] == null )
		&& ( d == maDay[x] )
		) {
			if ( strOption == "text" ) rv += maText[x] + "<br>"; //return maText[x];
			else if ( strOption == "clrtext" ) return maClrText[x];
			else if ( strOption == "clrback" ) return maClrBack[x];
			else return null;
		};
		x++;
	};
   if(rv!="") return rv;
	return "&nbsp";
}

// ---------------------------------------------------------------------------------------
function DHTMLCal_CheckLeapYear(m, y) {
	var x = 2;

	if ( m == x ) {
        	if ( y % 4 == 0 ) {
               		if ( y % 100 == 0) {
                    		if ( y % 400 == 0) maDaysPerMonth[x] = 29;
               		} else {
                    		maDaysPerMonth[x] = 29;
			}
		}
	}
}

// ---------------------------------------------------------------------------------------
function DHTMLCal_FillMonth( m ) {
	var strHTML = "";

	for ( i=0; i<=11; i++ ) {
		var strSelected = "";
		if ( i == m ) strSelected = "selected";

		strHTML = strHTML + "<option value='" + i + "' " + strSelected + " >" + maLongMonths[i] + "</option>" + R;
	};
	return strHTML;
}

// ---------------------------------------------------------------------------------------
function DHTMLCal_FillYear( y ) {
	var strHTML = "";

	for ( i=y-2; i<=y+5; i++ ) {
		var strSelected = "";
		if ( i == y ) strSelected = "selected";

		strHTML = strHTML + "<option value='" + i + "' " + strSelected + " >" + i + "</option>" + R;
	};
	return strHTML;
}

// ---------------------------------------------------------------------------------------
function DHTMLCal_Form() {
	var strHTML;
	var strTag;
	var strHide;
	var strOutput = "";

	var m = DHTMLCal_GetDate("m");
	var y = DHTMLCal_GetDate("y");

	// ----- exit the function if user doesn't want the month or year drop-downs
	if (mbDisplayMonthCombo==false && mbDisplayYearCombo==false) {
	} else {

	// ----- begin form
	strHTML = "<form name='frmCal' method='post' action=''>" + R;
	strOutput = strOutput + strHTML;

	// ----- begin table
	strHTML = "<table"
		+ " align=center"
		+ " width='" + ((mnCellWidth) * 7) + "'"
		+ " border='1'"
		+ " bordercolor='" + mclrBorder + "'"
		+ " bordercolordark='" + mclrBorder + "'"
		+ " bordercolorlight='" + mclrBorder + "'"
		+ " cellspacing=0"
//		+ " cellpadding=4"
		+ " >" + R;
	strOutput = strOutput + strHTML;

	// ----- month & year selector
	strHTML = "<tr><td"
		+ " align=center"
		+ " bgcolor=" + mclrHdrBg
//		+ " colspan = 7"
		+ " >" + R + R;
	strOutput = strOutput + strHTML;

	// ----- month combo
	strTemp = " cboYear.options[frmCal.cboYear.selectedIndex].value";
	if (mbDisplayYearCombo==false) strTemp = y.toString();

	strHTML = "<select name='cboMonth'"
		+ " onchange='DHTMLCal_Update(" + R
		+ " cboMonth.options[frmCal.cboMonth.selectedIndex].value"
		+ "," + R
		+ strTemp
		+ ");'>" + R
		+ DHTMLCal_FillMonth(m)
		+ "</select>" + R + R;
	if (mbDisplayMonthCombo==true) strOutput = strOutput + strHTML;

	// ----- year combo
	strTemp = " cboMonth.options[frmCal.cboMonth.selectedIndex].value";
	if (mbDisplayMonthCombo==false) strTemp = m.toString();

	strHTML = "<select name='cboYear'"
		+ " onchange='DHTMLCal_Update(" + R
		+ strTemp
		+ "," + R
		+ " cboYear.options[frmCal.cboYear.selectedIndex].value"
		+ ");'>" + R
		+ DHTMLCal_FillYear(y)
		+ "</select>" + R + R;
	if (mbDisplayYearCombo==true)  strOutput = strOutput + "&nbsp" + strHTML;

	strHTML = "</td></tr>" + R;
	strOutput = strOutput + strHTML;

	// ----- end the table
	strOutput = strOutput + "</table></form>" + R + R;

	document.writeln(strOutput);
	};
}

// ---------------------------------------------------------------------------------------
function DHTMLCal_Update(m, y) {
	var obj;
	var strHTML;
	var bRedraw = true;

	if (m==null && y==null) {
		bRedraw = false;
		m = DHTMLCal_GetDate("m");
		y = DHTMLCal_GetDate("y");
	};

	// write the current month and year to a cookie
	// will expire in one hour
	DHTMLCal_SetDate(m, y)

	strHTML = DHTMLCal_Create( m, y );

	if ( mstrBrowserName == "IE" ) {
		// microsoft internet explorer (handle ver 4 & 5)
		if (bRedraw==true) {
			document.all["CALDIV"].innerHTML = strHTML;
		} else {
			document.writeln(strHTML);
		};
	} else if ( mstrBrowserName == "NS" ) {
		if ( mstrBrowserVer < "5" ) {
			// netscape version 4
			if (bRedraw==true) {
				document.ALIGN.document.CALLAYER.document.write(strHTML);
				document.ALIGN.document.CALLAYER.document.close();
			} else {
				document.ALIGN.document.CALLAYER.document.writeln(" ");
				document.ALIGN.document.CALLAYER.document.writeln(strHTML);
				document.ALIGN.document.CALLAYER.document.writeln(" ");
			};
		} else {
			// netscape version 5 and up
			obj = document.getElementById("CALDIV");
			DHTMLCal_SetInnerHTML(obj, strHTML);
		};
	};
}

// ---------------------------------------------------------------------------------------
function DHTMLCal_CheckColor( nRow, nCol, dteCal, dteNow, m ) {
	var strID = "c" + nCol + "r" + nRow;
	var currD = DHTMLCal_getDay(dteCal);
	var currM = dteCal.getMonth();
	var currY = dteCal.getYear();
	var temp = nCol + (nRow * 7);

	// Is this a "dead" cell?
	if ( currD > temp || currM != m ) {
		return mclrDead;

	} else {
		if ( dteCal.getYear() < dteNow.getYear()) {
			if (mbWeekendColor &&  DHTMLCal_isWeekday(dteCal)==false) return mclrWeekend;
			return mclrPast;
		} else if (dteCal.getYear() > dteNow.getYear()) {
			if (mbWeekendColor &&  DHTMLCal_isWeekday(dteCal)==false) return mclrWeekend;
			return mclrFuture;
			if (DHTMLCal_isWeekday(dteCal)==false) return mclrWeekend;
		} else {
			// Same year...
			if (dteCal.getMonth() < dteNow.getMonth() ) {
				if (mbWeekendColor &&  DHTMLCal_isWeekday(dteCal)==false) return mclrWeekend;
				return mclrPast;
			} else if (dteCal.getMonth() > dteNow.getMonth() ) {
				if (mbWeekendColor &&  DHTMLCal_isWeekday(dteCal)==false) return mclrWeekend;
				return mclrFuture;
			} else {
				// Same month...
				if (dteCal.getDate() < dteNow.getDate()) {
					if (mbWeekendColor &&  DHTMLCal_isWeekday(dteCal)==false) return mclrWeekend;
					return mclrPast;
				} else if (dteCal.getDate() > dteNow.getDate()) {
					if (mbWeekendColor &&  DHTMLCal_isWeekday(dteCal)==false) return mclrWeekend;
					return mclrFuture;
				} else {
					return mclrNow;
				}
			}
		}
	}
}

// ---------------------------------------------------------------------------------------
function DHTMLCal_Create( m, y ) {
	var strOutput = "";
	var strForeColor;
	var strBackColor;
	var strClrText;
	var strClrBack;
	var strHTML;
	var strID;
	var strCell;
	var strNum;
	var strText;
	var strTag;
	var nRow;
	var nCol;
	var nDeadDay;
	var bGoodDate=false;
	var nWidth;


	var dteNow = new Date();
	var dteCal = new Date(y, m, 1);
	var dteMonth = new Date(y, m, 1);
	DHTMLCal_CheckLeapYear(m, y);

	// ----- find the first day and subtract back to Sun
	dteCal.setDate( dteCal.getDate() - DHTMLCal_getDay(dteCal) );

	// ----- determine the sequence of the "dead" cells
	nDeadDay = dteMonth.getDate() - DHTMLCal_getDay(dteMonth);

	// ----- set the column width (fix for Netscape NOWRAP)
	nWidth = mnCellWidth;
	if (mstrBrowserName=="NS") nWidth = nWidth - 15;

	// ----- begin table
	strHTML = "<table align=center"
		+ " bgColor=" + mclrTableBg
		+ " border='1'"
		+ " bordercolor='" + mclrBorder + "'"
		+ " bordercolordark='" + mclrBorder + "'"
		+ " bordercolorlight='" + mclrBorder + "'"
		+ " width='" + (mnCellWidth * 7) + "'"
		+ " cellspacing=0"
		+ " cellpadding=4"
		+ " >";
	strOutput = strOutput + strHTML + R + R;

	// ----- Create the WEEKDAY headers
	strOutput = strOutput + "<tr>" + R;
	for( nCol = 0; nCol < 7; nCol++) {
		strHTML = "<td align=center"
			+ " width=" + nWidth
			+ " bgcolor=" + mclrHdrBg
			+ " nowrap "
			+ " >"
			+ DHTMLCal_FontStr( mstrHdrFace, mstrHdrSize, mclrHdrText )
			+ " <b><center>" + maLongDays[nCol]
			+ " </center></b></font></td>";
		strOutput = strOutput + strHTML + R;
	}
	strOutput = strOutput + "</tr>" + R + R;

	// ----- now create calendar grid ( 7 columns by 6 rows )
	for (nRow = 0; nRow < 6; nRow++)	{

		strOutput = strOutput + "<tr>";
		for( nCol = 0; nCol < 7; nCol++) {

			// ----- create unique ID
			strID = "c" + nCol + "r" + nRow;

			// ----- determine color and text
			strBackColor = DHTMLCal_CheckColor( nRow, nCol, dteCal, dteNow, m );

			var chkM = dteCal.getMonth();
			var chkD = dteCal.getDate();
			var chkY = dteCal.getFullYear();

			if (strBackColor == mclrDead) {
				strNum = dteCal.getDate();
				if (mbDisplayDeadNumber == false && mbDisplayDeadText == false) strNum = "&nbsp;";
				if (mbDisplayDeadText == false) {
					chkM = parseInt(m);
					chkY = parseInt(y);

					strText = DHTMLCal_GetEvent(chkM, nDeadDay, chkY, "text");
					strClrText = DHTMLCal_GetEvent(chkM, nDeadDay, chkY, "clrtext");
					strClrBack = DHTMLCal_GetEvent(chkM, nDeadDay, chkY, "clrback");
				} else {
					strText = DHTMLCal_GetEvent(chkM, chkD, chkY, "text");
					strClrText = DHTMLCal_GetEvent(chkM, chkD, chkY, "clrtext");
					strClrBack = DHTMLCal_GetEvent(chkM, chkD, chkY, "clrback");
				};
			} else {
				strNum = dteCal.getDate();
				strText = DHTMLCal_GetEvent(chkM, chkD, chkY, "text");
				strClrText = DHTMLCal_GetEvent(chkM, chkD, chkY, "clrtext");
				strClrBack = DHTMLCal_GetEvent(chkM, chkD, chkY, "clrback");
			};

			// ----- text & color for cell
			if (strText == "") strText=" ";
			if ( strClrBack != null && strClrBack != "&nbsp" ) strBackColor = strClrBack;
			strForeColor = mclrCellText;
			if ( strClrText != null && strClrText != "&nbsp" ) strForeColor = strClrText;

			strCell = DHTMLCal_FontStr(mstrNumFace, mstrNumSize, strForeColor) + R
				+ "<strong><a href='l.asp?P=cal&SP=add&D="+strNum+"&M="+(parseInt(m)+1)+"&Y="+y+"'>" + strNum + "</a></strong></font>" + R
				+ "<br>"
				+ DHTMLCal_FontStr(mstrCellFace, mstrCellSize, strForeColor) + R
				+ strText + R + "</font>" + R;

			// ----- HTML for cell



			strHTML = "<td"
				+ " valign=top"
				+ " width=" + nWidth
				+ " height=" + mnCellHeight
				+ " bgcolor=" + strBackColor
				+ " nowrap"
				+ " >" + R;
			strTemp =  strHTML + strCell + "</td>" + R;
			strOutput = strOutput + strTemp;

			dteCal.setDate( dteCal.getDate() + 1 );
			nDeadDay++
		}
		strOutput = strOutput + "</tr>" + R + R;
	}
	strOutput = strOutput + R + R;

	// ---- end the table, form
	strOutput = strOutput + "</table>";

	return strOutput;
}

// ---------------------------------------------------------------------------------------
function DHTMLCal_FontStr ( strFace, strSize, strColor ) {
	var strHTML = "<font"
		+ " face='"  + strFace  + "'"
		+ " size='"  + strSize  + "'"
		+ " color='" + strColor + "'"
		+ " >";
	return strHTML;
}

// ---------------------------------------------------------------------------------------
function DHTMLCal_BrowserName () {
	var strOutput="";
	var strBrowser = navigator.appName;

	if ( strBrowser=="Microsoft Internet Explorer" ) {
		strOutput = "IE";
	} else if ( strBrowser=="Netscape" ) {
		strOutput = "NS";
	};
	return strOutput;
}

// ---------------------------------------------------------------------------------------
function DHTMLCal_BrowserVer () {
	var strVer = navigator.appVersion.charAt(0);
	return strVer;
}

// ---------------------------------------------------------------------------------------
function DHTMLCal_SetOuterHTML (obj, strHTML) {
	var range = document.createRange();
	range.setStartBefore(obj);

	var df = range.createContextualFragment(strHTML);
	obj.parentNode.replaceChild(df, this);
}

// ---------------------------------------------------------------------------------------
function DHTMLCal_SetInnerHTML (obj, strHTML) {
	var range = document.createRange();
	range.selectNodeContents(obj);
	range.deleteContents();

	var df = range.createContextualFragment(strHTML);
	obj.appendChild(df);
}

// ---------------------------------------------------------------------------------------
function DHTMLCal_SetDate (m, y) {
	var mm = parseInt(m) + 1;

	var strYear =  y.toString();
	var strMonth = mm.toString();

	if (strMonth.length==1) strMonth = "0" + strMonth;
	// alert("write: " + strMonth + " / " + strYear);

	DHTMLCal_CookieSet("dhtmlcal", strYear + strMonth);
};

// ---------------------------------------------------------------------------------------
function DHTMLCal_GetDate (strOption) {
	var strValue = DHTMLCal_CookieGet("dhtmlcal");
	var m, strMonth
	var y, strYear

	if (strValue==false) {
		var dCurrDate = new Date();
		m = dCurrDate.getMonth();
		y = dCurrDate.getFullYear();
	} else {
		strMonth = strValue.substring(4, 6);
		strYear = strValue.substring(0, 4);

		m = parseInt(strMonth);
		y = parseInt(strYear);

		if (strMonth != m.toString()) {
			strMonth = strMonth.substring(strMonth.lastIndexOf("0")+1,strMonth.lastIndexOf("0")+2);
			m = parseInt(strMonth);
		};

		m--;
	};

	//alert("read: " + strMonth + " / " + strYear);

	if (strOption=="m") return m;
	if (strOption=="y") return y;

	return -1;
};

// ---------------------------------------------------------------------------------------
function DHTMLCal_CookieSet (strName, strValue, hours, strPath, strDomain, strSecure) {
	var numHours;

	if ( (typeof(hours) == 'string') && Date.parse(hours) ) {
		// already a Date string
		numHours = hours;
	} else if (typeof(hours) == 'number') {
		// calculate Date from number of hours
		numHours = (new Date((new Date()).getTime() + hours*3600000)).toGMTString();
	};

	// Set the cookie, adding any parameters that were specified.
  	document.cookie = strName + "=" + escape(strValue)
  		+ ((numHours == null) ? "" : "; expires=" + numHours)
  		+ ((strPath == null) ? "" : "; strPath=" + strPath)
  		+ ((strDomain == null) ? "" : "; strDomain=" + strDomain)
  		+ ((strSecure == null) ? "" : "; strSecure");
};

// ---------------------------------------------------------------------------------------
function DHTMLCal_CookieGet (strName) {
	var strData;
	var nBegin;
	var nEnd;

	var MyCookie = document.cookie;

	if (MyCookie.length>0) {
		nBegin = MyCookie.indexOf(strName);
		if (nBegin != -1) {
			nBegin += strName.length;
			nEnd = MyCookie.indexOf(";", nBegin);
			if (nEnd==-1) nEnd = MyCookie.length;
			strData = unescape(MyCookie.substring(nBegin+1, nEnd));
			return strData;
		} else {
			//no cookie of name found
			return false;
		};
	} else {
		//no cookie found
		return false;
	};

};

// ---------------------------------------------------------------------------------------
function DHTMLCal_PopUp (strHREF, bNewWindow) {
	var winPopup;
	var strValues="width=400,height=300,scrollbars=yes,dependent=yes";

	if (bNewWindow) {
	  	winPopup = window.open(strHREF, "_blank", strValues);
	} else {
	  	winPopup = window.open("", "popup", strValues);
		winPopup.location.href = strHREF;
	}
};

// ---------------------------------------------------------------------------------------
function DHTMLCal_getDay (dte) {
	var day;

	day = dte.getDay();
	if (mbBeginMonday) day--;
	return day;
};

// ---------------------------------------------------------------------------------------
function DHTMLCal_isWeekday (dte) {
	var day;

	day = dte.getDay();
	if (day == 0 || day == 6) {
		return false;
	} else {
		return true;
	};
};