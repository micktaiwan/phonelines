<%
   function Stop() {
      obj = "";
      sms.EndCon();
      sms = "";
      Response.End();
      }

   function SendErrorToText(error) {
      switch(error) {
         case 0: return "�T���ǰe���\"
         case 1: return "��O�榡���~"
         case 2: return "�s�X�榡���~"
         case 3: return "�u���v�榡���~"
         case 4: return "Msg_content_len�榡���~"
         case 5: return "Msg_content_len�Pmsg_content�����פ��۲�"
         case 6: return "������X�榡"
         case 7: return "�ǰe�������榡���~"
         case 8: return "���e�I��ɶ��榡���~"
         case 9: return "�w���ǰe�ɶ��榡���~"
         case 10: return "�ثe�Ȥ��}��ǰe�ܰ�~"
         case 11: return "�t�μȮɵL�k�ǰe�T��"
         case 13: return "wap push��url�S���]�w"
         case 14: return "wap push���T�����e�W�L88��byte"
         case 16: return "²�T���e�]�t�s��9-10�X���q�ܸ��X�A���X�W�w"
         case -4: return "�ǰe/������ƿ��~"
         default: return "Unknown error"
         }  
      }

   function ConnectErrorToText(error) {
      switch(error) {
         case 0: return "�b��/�K�X�ˬd���\"
         case 1: return "�K�X���~"
         case 2: return "�b�����s�b"
         case 3: return "�W�L��\�̤j�s�u��"
         case -1: return "Socket �s������"
         case -2: return "�dserver dns -> ip ���~"
         case -3: return "Socket��l�ƿ��~"
         case -4: return "Socket �ǰe/������ƿ��~"
         default: return "Unknown error"
         }  
      }
      
   function TrackMessage(id) {
      switch(id) {
         case 0: return "�T���w�e�F������"
         case 1: return "������}�Φb���T�d��~"
         case 2: return "�d�ߨt�εL��MessageID���"
         case 3: return "MessageID�榡���~"
         case 4: return "�w�e��²�T���ߡA�|�������d��"
         case 5: return "�w���ɶ��W�L48�p��"
         case -4: return "Socket �ǰe/������ƿ��~"
         default: return "Unknown error"
         }  
      }
%>
