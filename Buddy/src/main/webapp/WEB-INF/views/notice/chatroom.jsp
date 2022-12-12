<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
// 전역변수 설정
var socket  = null;
$(document).ready(function(){
    // 웹소켓 연결
    sock = new SockJS("/echo-ws");
    socket = sock;

    // 데이터를 전달 받았을때 
    sock.onmessage = onMessage; // toast 생성

    
 // notifySend
    $('#notifySendBtn').click(this, function(e){
/*         let recv = this.parentNode.parentNode;
        let content = document.getElementById('toadmin').value; */
        let recv = 'admin';
        let content = document.getElementById('toadmin').value;
        console.log('target'+recv);
        console.log('content'+content);
         let url = '/msg/sent'; 
        // 전송한 정보를 db에 저장	
         $.ajax({
            type: 'post',
            url: '/msg/sent',
            dataType: 'text',
            data: {
                recv: recv,
                content: content,
            },
            success: function(){    // db전송 성공시 실시간 알림 전송
                // 소켓에 전달되는 메시지
                // 위에 기술한 EchoHandler에서 ,(comma)를 이용하여 분리시킨다. */
           socket.send("수신인:,"+recv+","+content);
           close();
            }
        }); 
  
    });   
    
});

 
</script>
</head>
<body>

</body>
</html>