<%
   function isArray(a) { return a.constructor == Array; }
   function isNonEmptyArray(a) { return Boolean(isArray(a) && a.length); }

   function Tomorrow() {
      var now = new Date(new Date().valueOf() + 86400000);
      var y = now.getYear();
      var m = now.getMonth()+1;
      var d = now.getDate();
      return  y + "/" + m + "/" + d;
      }

   function und(t) {
      if(String(t) == "undefined") return '';
      return String(t);
      }


   function ToSQL(str) {

      str = String(str);
      str = str.replace(/'/g,"''");

      return str;

      }

   function IsLogged(key) {

      var s = GetSession(String(key) + "ID");
      return(s!="" && s!="undefined");

      }


   function extention(file) { // return the the extention without the dot

      file = String(file);
      var i = file.lastIndexOf(".");
      if(i==-1) return "";
      else return(file.substr(i+1,file.length-(i+1)));

      }

   function MyNow(ext) {

      var now = new Date();
      var y = now.getYear();
      var m = now.getMonth()+1;
      var d = now.getDate();
      var h = now.getHours();
      var n = now.getMinutes();
      var s = now.getSeconds();

      var date1 = y + "/" + m + "/" + d;
      if(ext==1) date1 += " " + h +":" + n + ":" + s;
      else if(ext==3) date1 += " " + h +":" + n;
      return date1;

      }

   function GetSession(str) {

      str = String(Session(str));
      var i;
      for(i=0; i< str.length;i++)
         if(str.charCodeAt(i)==0) return str.substring(0,i);

      return str;

      }

	function log(s) {
    	var cfile = Server.Mappath("log.txt");
     	var fs = Server.CreateObject("Scripting.FileSystemObject");
     	var out = fs.OpenTextFile(cfile,8,true);
     	out.WriteLine(String(s));
      out = "";
      fs = "";
      }

%>
