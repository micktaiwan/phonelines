   var opt = "";
   var txt = "(1/2) 資料讀取中...";

   //============================
   function sendform_normal(date,team) {
      setstatus(txt);
      majax.get("gifts/search/fetchnormal.asp?D="+date+"&T="+team,display_normal);
      }
   function display_normal(s) {
      document.getElementById("sendform_result").innerHTML = unescape(unescape(s));
      getgifts("normal");
      //sortables_init();

      }
   //============================
   function sendform_daily(date,zone) {
      setstatus(txt);
      opt = "&D="+date+"&Z="+zone;
      majax.get("gifts/search/fetchdaily.asp?D="+date+"&Z="+zone,display_daily);
      }
   function display_daily(s) {
      document.getElementById("sendform_result").innerHTML = unescape(unescape(s));
      getgifts("daily",opt);
      }
   //============================
   function sendform_total(date1,date2, zone, team) {
      setstatus(txt);
      opt = "&Z="+zone+"&T="+team;
      majax.get("gifts/search/fetchtotal.asp?DA="+date1+"&DB="+date2+"&Z="+zone+"&T="+team,display_total);
      }
   function display_total(s) {
      document.getElementById("sendform_result").innerHTML = unescape(unescape(s));
      getgifts("total",opt);
      }
   //============================
   function sendform_list(date,zone,sort) {
      setstatus(txt);
      majax.get("gifts/search/fetchlist.asp?D="+date+"&Z="+zone+"&S="+sort,display_list);
      }
   function display_list(s) {
      document.getElementById("sendform_result").innerHTML = unescape(unescape(s));
      getgifts("list");
      }

