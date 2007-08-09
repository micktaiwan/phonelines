function isValidDate(dateStr, format) {
   if (format == null) { format = "YMD"; }
   format = format.toUpperCase();
   if (format.length != 3) { format = "MDY"; }
   if ( (format.indexOf("M") == -1) || (format.indexOf("D") == -1) || (format.indexOf("Y") == -1) ) { format = "MDY"; }
   if (format.substring(0, 1) == "Y") { // If the year is first
      var reg1 = /^\d{2}(\-|\/|\.)\d{1,2}\1\d{1,2}$/
      var reg2 = /^\d{4}(\-|\/|\.)\d{1,2}\1\d{1,2}$/
   } else if (format.substring(1, 2) == "Y") { // If the year is second
      var reg1 = /^\d{1,2}(\-|\/|\.)\d{2}\1\d{1,2}$/
      var reg2 = /^\d{1,2}(\-|\/|\.)\d{4}\1\d{1,2}$/
   } else { // The year must be third
      var reg1 = /^\d{1,2}(\-|\/|\.)\d{1,2}\1\d{2}$/
      var reg2 = /^\d{1,2}(\-|\/|\.)\d{1,2}\1\d{4}$/
   }
   // If it doesn't conform to the right format (with either a 2 digit year or 4 digit year), fail
   if ( (reg1.test(dateStr) == false) && (reg2.test(dateStr) == false) ) { return false; }
   var parts = dateStr.split(RegExp.$1); // Split into 3 parts based on what the divider was
   // Check to see if the 3 parts end up making a valid date
   if (format.substring(0, 1) == "M") { var mm = parts[0]; }
   else if (format.substring(1, 2) == "M") { var mm = parts[1]; } else { var mm = parts[2]; }
   if (format.substring(0, 1) == "D") { var dd = parts[0]; }
   else if (format.substring(1, 2) == "D") { var dd = parts[1]; } else { var dd = parts[2]; }
   if (format.substring(0, 1) == "Y") { var yy = parts[0]; }
   else if (format.substring(1, 2) == "Y") { var yy = parts[1]; } else { var yy = parts[2]; }
   if (parseFloat(yy) <= 50) { yy = (parseFloat(yy) + 2000).toString(); }
   if (parseFloat(yy) <= 99) { yy = (parseFloat(yy) + 1900).toString(); }
   var dt = new Date(parseFloat(yy), parseFloat(mm)-1, parseFloat(dd), 0, 0, 0, 0);
   if (parseFloat(dd) != dt.getDate()) { return false; }
   if (parseFloat(mm)-1 != dt.getMonth()) { return false; }
   return true;
}


   function MyNow(ext) {

      var now = new Date();
      var y = now.getYear();
      if(y<200) y = y + 1900;
      var m = now.getMonth()+1;
      var d = now.getDate();
      var h = now.getHours();
      var n = now.getMinutes();
      var s = now.getSeconds();

      var date1 = y + "/" + m + "/" + d;
      if(ext) date1 += " " + h +":" + n + ":" + s;
      return date1;

      }

function checkchinese(str) {
  var strlen = str.length;
  if(strlen > 0){
    for(var i=0;i < strlen;i++) {
      c = '';
      c = escape(str.charAt(i));
      if(c.charAt(0) == '%') {
        cc = c.charAt(1); //IE~u,NS~A
        if(cc == 'A' || cc=='B' || cc =='u') return true;
        //else alert(cc);
        }
      }
    return false;
    }
  else return false;
  }

function CheckLength(type) {

  var data = document.sms.MESS.value;
  var datalen = data.length;
  var isChinese = checkchinese(data);
  var max;
  if(isChinese) {
      if(type=="0") max = 69;
      else max = 31;
      }
  else {
      if(type=="0") max = 159;
      else max = 31;
      }
   if(datalen > max) {
      document.sms.MESS.value = data.substr(0,max);
      datalen=document.sms.MESS.value.length;
      }
   document.sms.nbchars.value = max-datalen;

   }

function sendsms() {
   f = document.sms;
   dest = f.DEST;
   var nodest = 0;
   if(String(dest) == "undefined") nodest = 1;
   else if (dest.checked==false) nodest = 1;
   else if(String(dest.length)!="undefined") {
      nodest = 1;
      for(i=0; i<dest.length;i++) if(dest[i].checked==true) nodest = 0;
      }
   if(f.BULK.value=="" && nodest) {
      alert("No recipient");
      return false;
      }
   f.submit();
   return true;
   }

function openConfirm(url,w,h) {
	window.open(url,'','location=no,resizable=no,status=no,titlebar=no,directories=no,toolbar=no,menubar=no,scrollbars=yes,width='+w+',height='+h);
	return false;
   }

function ShowHide(id) {
   var itm = null;
   if (document.getElementById) {
      itm = document.getElementById(id);
      }
   else if (document.all){
      itm = document.all[id];
      }
   else if (document.layers){
      itm = document.layers[id];
      }

   if (!itm) return;

   if (itm.style) {
      if (itm.style.display == "none") {
         itm.style.display = "";
         }
      else {
         itm.style.display = "none";
	      }
      }
   else {
      itm.visibility = "show";
      }
   }

function indexOf(a,s) {
   var len = a.length;
   var i;
   for(i=0; i<len;++i) {
      if(a[i]==s) return i;
      }
   return -1;
   }

function g(s) {return document.getElementById(s);}
