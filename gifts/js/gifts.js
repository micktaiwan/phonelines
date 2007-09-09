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

function addNb(id,y,nb) {
   var r = document.getElementById(id);
   if(!r) setstatus("addNb: can not find r. ");
   else {
      if(r.cells[y].innerHTML=="") r.cells[y].innerHTML = "0";
      r.cells[y].innerHTML = parseInt(r.cells[y].innerHTML)+parseInt(nb);
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
	
function sort_gifts(a,b){
	i = 0;
	a = a[0]
	b = b[0]
	for(z=0;z<a.length-1;++z) if(a[z]==" ") a[z] = 'z';
	for(z=0;z<b.length-1;++z) if(b[z]==" ") b[z] = 'z';
	while(a[i] == b[i] && i < a.length-1 && i < b.length-1) ++i;
	//alert(a+" "+b+" "+i+" "+(a[i] < b[i]))
	return (a[i] < b[i])? -1:1
	}
//alert(sort_gifts("2         ","1020      "));
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
   var pairs, g, gifts = new Array, len = rows.length;
   var col;
	try {
	   for(i=0;i<len;++i) {
	      pairs = rows[i].split(":");
	      if(!pairs[0]) continue;
	      g = pairs[1].split(","); //  gifts = [code,name,nb]
	      for(j=0;j<g.length;j+=3) {
	         if(g[j]=="") continue;
				gifts.push(new Array(g[j], g[j+1], g[j+2], pairs[0])); // build a object that we can sort [code,name,nb,visitid]
	         }
	      }
		// sort by code as wanted by chu	
		gifts = gifts.sort(sort_gifts)
		// display titles and numbers
	   for(i=0;i<gifts.length;++i) {
			col = addGiftTitle(gifts[i][1]);
			addNb(gifts[i][3],col,gifts[i][2]);
			}
	   addSum();
	   setstatus("&nbsp;");
		}
	catch(e) {
		alert(e+"\n"+s);
		}
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
   if(opt==null) majax.get("gifts/js/getgifts_"+mode+".asp?IDS="+s+"&XX="+new Date().getTime(),getgifts_result);
   else majax.get("gifts/js/getgifts_"+mode+".asp?IDS="+s+opt+"&XX="+new Date().getTime(),getgifts_result);
   }
