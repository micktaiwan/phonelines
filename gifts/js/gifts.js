var GiftTitles;
var nbfixedcols;

function setstatus(s) {
   var st = document.getElementById("status");
   if(!st) alert("no status id found on this page\nMsg was: "+s);
   else st.innerHTML = s;
   }

function addGiftTitle(name) {
   var i = indexOf(GiftTitles,name);
   if(i >= 0) return nbfixedcols+i;
   GiftTitles.push(name);
   var t = document.getElementById('gifttable');
   var x;
   var y;
   x = t.rows[0];
   var index = x.cells.length;
   //alert("index:"+index);
   y = x.insertCell(index);
   y.innerHTML = name;
   for(i=1;i<t.rows.length;++i) {
      x = t.rows[i];
      y = x.insertCell(x.cells.length);
      y.innerHTML = "";
      }
   return index;
   }

function addNb(id,y,nb,opt) {
   var r = document.getElementById(id);
   if(!r) setstatus("addNb: can not find r. ");
   else {
      if(r.cells[y].innerHTML=="") r.cells[y].innerHTML = "0";
      r.cells[y].innerHTML = parseInt(r.cells[y].innerHTML)+parseInt(nb);
      //r.cells[y].innerHTML = r.cells[y].innerHTML+" <a href='#' onclick=\"alert('"+opt+"');\">Edit</a>";
      }
   }

function getRowById(id) {
   return document.getElementById(id);
   }

function sumcol(col) {
   var t = document.getElementById("gifttable");
   var rv = 0;
   var i;
   var c;
   var len = t.rows.length-1;
   for(i=1;i<len;++i) {
      c = t.rows[i].cells[col+nbfixedcols];
      //alert(col+" "+i+" "+c.innerHTML);
      if(c.innerHTML!="") rv += parseInt(c.innerHTML);
      }
   return rv;
   }

function addSum() {
   var t = document.getElementById("gifttable");
   var r = t.insertRow(t.rows.length);
   r.style.background = "white";
   y = r.insertCell(0);
   y.innerHTML = "<center>合計</center>";
   y.colSpan = nbfixedcols;

   for(i=0;i<t.rows[0].cells.length-nbfixedcols;++i) {
      y = r.insertCell(r.cells.length);
      y.innerHTML = sumcol(i);
      }

   }

function getgifts_result(s) {
   if(s=="") {
      setstatus("<strong>無贈品資料</strong>");
      return;
      }
   GiftTitles = new Array;
   var table = document.getElementById("gifttable");
   if (!table.rows || !table.rows.length || !table.rows[0]) {
      setstatus("<strong>Error: No first row !</strong>");
      return;
      }
   nbfixedcols = table.rows[0].cells.length;
   s = unescape(unescape(s));
   //alert(s);
   var rows = s.split(";");
   var pairs;
   var gifts;
   var len = rows.length;
   var col;
   var opt;
   for(i=0;i<len;++i) {
      pairs = rows[i].split(":");
      if(!pairs[0]) continue;
      gifts = pairs[1].split(",");
      for(j=0;j<gifts.length;j+=2) {
         if(gifts[j]=="") continue;
         col = addGiftTitle(gifts[j]);
         //alert(col+" "+pairs[0]+": "+gifts[j]+" "+gifts[j+1]);
         addNb(pairs[0],col,gifts[j+1], opt);
         }
      }
   addSum();
   setstatus("&nbsp;");
   }

function getgifts(mode,opt) {
   setstatus("(2/2) 請稍候, 顯示中...");
   var s = "";
   var table = document.getElementById("gifttable");
   if(!table) {
      setstatus("<strong>No gifttable</strong>");
      return;
      }
   var len = table.rows.length;
   for(i=1;i<len;++i) {
      if(s!="")  s += ",";
      s += table.rows[i].id;
      }
   //alert(s+", opt="+opt);
   if(opt==null) majax.get("gifts/js/getgifts_"+mode+".asp?IDS="+s,getgifts_result);
   else majax.get("gifts/js/getgifts_"+mode+".asp?IDS="+s+opt,getgifts_result);
   }
