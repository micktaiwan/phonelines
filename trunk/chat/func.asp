<%
   function GetSession(str) {

      str = String(Session(str));
      var i;
      for(i=0; i< str.length;i++)
         if(str.charCodeAt(i)==0) return str.substring(0,i);

      return str;

      }

%>
