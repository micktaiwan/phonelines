function Majax() {

   var baseurl;
   var bdebug = false;

   //******************
   // public functions
   //******************

   this.setBaseUrl = function (u) {
      baseurl = u;
      //document.write(u);
      }

   this.setDebug = function(b) {
      bdebug = b;
      }


   this.get = function(file, callback) {
      //var url = funcurl+u
      var x = init_object();
   	x.open('GET', baseurl+file, true);

   	x.onreadystatechange = function() {
         if (x.readyState != 4) return;
   		debug('received ' + x.responseText);
   		debug('status ' + x.status+": "+x.statusText);
         callback(x.responseText, x.responseXML);
   		}

      x.send(null);
      debug("waiting for url=" + baseurl);
   	}

   //******************
   // private functions
   //******************

   debug = function(str) {
      if(bdebug) alert(str);
      }

   init_object = function() {
      debug('init_object() called..')
      var A;
      try {A=new ActiveXObject('Msxml2.XMLHTTP');}
      catch (e) {
         try {A=new ActiveXObject('Microsoft.XMLHTTP');}
         catch (oc) {A=null;}
         }
      if(!A && typeof XMLHttpRequest != 'undefined') A = new XMLHttpRequest();
      if (!A) debug('Could not create connection object.');
      return A;
      }

   }

