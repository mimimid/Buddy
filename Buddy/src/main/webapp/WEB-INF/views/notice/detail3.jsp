<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="ko">
<head>
  <meta charset="UTF-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">

  <link rel="stylesheet" href="${path}/resources/css/reset.css">
  <link rel="stylesheet" href="${path}/resources/css/index.css">
  <link rel="stylesheet" href="//cdn.jsdelivr.net/npm/xeicon@2.3.3/xeicon.min.css">

<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>
	<script src="/resources/sockjs.min.js"></script>


  <title>공지사항</title>

  <style>
  #msgStack {
    position: fixed;
    bottom: 30px;
    left: 50%;
    padding: 15px 20px;
    transform: translate(-50%, 10px);
    border-radius: 30px;
    overflow: hidden;
    font-size: .15rem;
    opacity: 0;
    visibility: hidden;
    transition: opacity .5s, visibility .5s, transform .5s;
    background: #dc143c;
    color: #fff;
    z-index: 10000;
}

#msgStack.reveal {
    opacity: 1;
    visibility: visible;
    transform: translate(-50%, 0)
}


#slider {
	/* ul태그의 기본 스타일 제거 */
	padding: 0;
	margin: 0;
	list-style-type: none;
	
	/* 자식요소 absolute를 받은 li태그의 기준점으로 설정하기 */
	position: relative;	
}

textarea::placeholder {color:#00f;}

#slider li {
	position: absolute;
}

#slider li img {
	width: 700px;
	height: 400px;
}
/*  ---------------------------------------  */
  		button {
          background-color: #ffffff;
          padding: 5px 10px;
          border-radius: 4px;
          cursor: pointer;
        }

        .modal {
          position: fixed;
          top: 0;
          left: 0;
          width: 100%;
          height: 100%;
          display: flex;
          justify-content: center;
          align-items: center;
        }

        .modal .bg {
          width: 100%;
          height: 100%;
          background-color: rgba(0, 0, 0, 0.6);
        }

        .modalBox {
          position: absolute;
          background-color: #fff;
          width: 400px;
          height: 200px;
          padding: 15px;
        }

        .modalBox button {
          display: block;
          width: 80px;
          margin: 0 auto;
        }

        .hidden {
          display: none;
        }
         

select {
  width: 120px;
  height: 30px;
  padding: .1em .5em;
  font-family: inherit;
  background: url(https://farm1.staticflickr.com/379/19928272501_4ef877c265_t.jpg) no-repeat 95% 50%;
  -webkit-appearance: none;
  -moz-appearance: none;
  appearance: none;
  border: 0.5px solid #999;
  border-radius: 0px;
}

select::-ms-expand {
  /* for IE 11 */
  display: none;
}




.dropdown {
    display: inline-block;
}
#dropdown-btn {
	color: #000080;
    border: none;
    cursor: pointer;
}
#dropdown-btn:hover {
	color: #000080;
}
.dropdown-submenu{
    box-shadow: 0 0 10px rgba(0, 0, 0, 0.192);
    background-color: #fff;
    display: none;
}

.dropdown:hover .dropdown-submenu {
    display: block;
}
#myMsgDialog {
			width:40%; 
			background-color: #f4ffef; 
			border:1px solid black; 
			border-radius: 7px;
}		

#mButton {
			padding: 7px 30px;
			background-color: #66ccff;
			color: white;
			font-size: 15px;
			border: 0;
			outline: 0;
}
  </style>
 <!-- sockJS -->
<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<script>
// 전역변수 설정
var socket  = null;
$(document).ready(function(){
    // 웹소켓 연결
    sock = new SockJS("/echo");
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
 function onMessage(evt) {
    //받은 메시지 내용 추출
    var data = evt.data;
    console.log(data)
    toast(data);
  

} 


 let removeToast;

 function toast(string) {
     const toast = document.getElementById("msgStack");

     toast.classList.contains("reveal") ?
         (clearTimeout(removeToast), removeToast = setTimeout(function () {
             document.getElementById("msgStack").classList.remove("reveal")
         }, 1000)) :
         removeToast = setTimeout(function () {
             document.getElementById("msgStack").classList.remove("reveal")
         }, 1000)
     toast.classList.add("reveal"),
         toast.innerText = string
 }
 
</script>
    <script type="text/javascript">   
    
    function heartB(e) {
    	
    	var flag = $(e).children('i').attr('class');
    	if (flag == 'card xi-heart') {
    	$(e).children('i').removeClass("card xi-heart").addClass("card xi-heart-o");
    	} else {
    		$(e).children('i').removeClass("card xi-heart-o").addClass("card xi-heart");
    	}
    }

    function heratadd(e) {


    	var commentno = e.parentNode.parentNode.parentNode.childNodes[1].value;
    	console.log(commentno)
    	
    	
    	var flag = $(e).children('i').attr('class');
    	if (flag == 'card xi-heart') {
    	$(e).children('i').removeClass("card xi-heart").addClass("card xi-heart-o");
    	} else {
    		$(e).children('i').removeClass("card xi-heart-o").addClass("card xi-heart");
    	}
    	  
    }

    function md(e) {
    	//날짜, 수정버튼, 삭제버튼 구역
    	var rm = e.parentNode;
    	//댓글 내용 구역
    	var target = e.parentNode.parentNode.nextSibling.nextSibling;
    	//원래 댓글 내용
    	var precomment = target.innerText;
    	//날짜, 수정버튼, 삭제버튼 없애기
    	rm.innerHTML= "";
    	//댓글 내용 지우고 textarea 태그 만들기
    	target.innerText="";
    	target.innerHTML+="<textarea  style='width:650px; border: 1px solid rgba(0, 0, 0, 0.125); border-radius: 4px;resize: none;'>"+precomment+"</textarea>"
    	target.innerHTML+="<button onclick='mdok(this)'>수정 완료</button>"
    }

    function mdok(e) {
    	//수정된 댓글 내용
    	var content = e.parentNode.firstChild.value;
    	//수정될 댓글 번호
    	var commentno = e.parentNode.parentNode.parentNode.childNodes[1].value;
    	//최신순 추천순 옵션
    	//console.log(e.parentNode.parentNode.parentNode.parentNode.parentNode.parentNode.childNodes);
    	console.log(e.parentNode.parentNode.childNodes[1].childNodes[3]);
    	e.parentNode.parentNode.childNodes[1].childNodes[3].innerHTML='<button onclick="md(this)">수정</button><button>삭제</button>';

    	e.parentNode.parentNode.childNodes[3].innerText = content;
    	//DB상 내용 바꾸기
    	
  
    }


      function changeBggray() {
    		 document.getElementById('bt').style.backgroundColor = '#d3d3d3';
    	}

    	function changeBgNone() {
    		document.getElementById('bt').style.background = "none";
    		document.getElementById('bt').style.background = "none";
    	}	
    
  $(document).ready(function() {
	  
	//-----------------------------------댓글 등록 event------------------------------------	  
	  	$("#bt").on("click",function() {
	  		
/* 			var writer = '<c:out value="${userId}"/>';			
			console.log(writer);
			var boardno = '<c:out value="${boardno}"/>';
			var bcmtcontent = this.parentNode.parentNode.childNodes[1].childNodes[1].value;
			console.log(this.parentNode.parentNode.childNodes[1].childNodes[1].value); */
			var writer = '김희주';
			var boardno = '<c:out value='${board[0].BOARDNO }'/>';
			var bcmtcontent = this.parentNode.parentNode.childNodes[1].childNodes[1].value;
			console.log(writer +","+ boardno +","+ bcmtcontent);
	        // 	
	         $.ajax({
	            type: 'post',
	            url: '/bcmt/write',
	            dataType: 'text',
	            data: {
	            	writer: writer,
	            	boardno: boardno,
	            	bcmtcontent:bcmtcontent
	            },
	            success: function(){    
	            }
	        });
	         this.parentNode.parentNode.childNodes[1].childNodes[1].value='';
	  		
	  	} )   //댓글 작성 이벤트 끝 */ 
  } );
  


</script>
</head>
<body>

  <!-- header -->
  <header>
    <div class="header_top">
      <div class="header_inner">
        <div class="left">
          <div class="logo">
            <a href="#" ></a>
          </div>
          <a href="#" class="postype">포스타입</a>
        </div>
        <div class="right">
         <input type="text" placeholder="어떤 작품을 찾으세요?">
          <a href="#"><i class="xi-search"></i></a>
          <a href="#"><i class="xi-user-o"></i></a>
        </div>
      </div>
    </div>
    <div class="header_bottom">
      <div class="center">
        <a href="#">
          <i class="xi-angle-left-min"></i>
        </a>
        <div class="title">
          <p>공지사항</p>
          <p>
            <a href="#">
              보건교사 안은영              
            </a>
          </p>
        </div>
        <a href="#">
          <i class="xi-angle-right-min"></i>
        </a>
      </div>
      <div class="header_inner">
        <div class="left">
          <a href="#">
            <i class="xi-angle-left"></i>
          </a>
        </div>
        <div class="right">
          <ul>
			 <li><c:if test="${not empty login }">
              <button class="openBtn" style="border-style: solid; border-width: thin" onclick="openk(this)" value="6">✉ 관리자에게 메세지 보내기</button>
           </c:if>
           <c:if test="${empty login }">
              <button class="openBtn" style="border-style: solid; border-width: thin">✉ 비로그인 상태에서는 관리자에게 메세지를 보낼 수 없습니다</button>
           </c:if>
            <div class="modal hidden">
  <div class="bg"></div>
  <div class="modalBox">
    <p>관리자에게 하고싶은 말을 하세요</p>
    <input id="toadmin">
    <button class="closeBtn">취소</button>
    <button id="notifySendBtn">전송</button>
  </div>
   </div>
            </li>
          </ul>
        </div>
      </div>
    </div>
  </header>

  <!-- main -->
  <main>
    <section class="contents">
      <div class="inner">
        <article class="contents_header">
          <div class="top">
            <h3 class="series_tit">공지사항</h3>
            <h2 title="언젠간 나도 사랑을 하겠지" class="post_tit"><c:out value='${board[0].TITLE }'/></h2>
            <p class="post_subtit">관리자</p>
          </div>
          <div class="bottom">
            <div class="left">
              <a href="#"></a>
              <div class="author">
                <p>김희주</p>
                <p>2022.08.12 ·조회 4.2만</p>
              </div>
            </div>
            <div class="right">
              <a href="#"><i class="xi-external-link"></i></a>
            </div>
          </div>
        </article>
        <article class="contents_inner">
공지사항 내용입니다. 
<img alt="image" src="/upload/<c:out value='${board[0].STOREDNAME }'/>" width="60" height="60"/>
<%-- <a href="/upload/<c:out value='${board[0].STOREDNAME }'/>" download="<c:out value='${board[0].ORIGINNAME }'/>">
아니 왜?
</a> --%>
        </article>
        <article class="contents_bottom">
          <div class="left">
          <c:if test="${IsLike}">
           <a class="heart" onclick="heartB(this)">
              <i class="card xi-heart"></i>
             </a>
           </c:if>
            <c:if test="${!IsLike}">
           <a class="heart" onclick="heartB(this)">
              <i class="card xi-heart-o"></i>
             </a>
             </c:if>
            <div class="center_like">
              <div class="likes">
                <a href="#">
                  <span class="profil">
                    <span></span>
                    <span></span>
                    <span></span>
                  </span>
                </a>
                <span>1673명이 좋아합니다.</span>
              </div>
            </div>
          </div>
        </article>
      </div>
    </section>
  </main>

  <!-- contents_footer -->
  <section class="contents_footer">
    <div class="inner">
      <div class="mid">
        <div class="left">
          <div class="logo"></div>
          <div class="postype_origin">
            <p>강쥐마을</p>
            <p>구독자 1.4만</p>
          </div>
        </div>
        <div class="right">
          <button>후원 결제하기</button>
        </div>
      </div>      
    </div>
  </section>

  <!-- 댓글창 -->
  <section class="comment">
  <select style=" margin-left: 81em; font:10px">
    <option>최신순</option>
    <option>추천순</option>
</select>
    <div class="inner">
      <article class="list">
        <p class="num">21개의 댓글</p>
        <!-- ------------------------------------------------------------------- -->
        <div class="comment1 comm">
          <div class="profil_img">
            <a href="#"></a>
          </div>
          <div class="comment_txt">
            <div class="top">
              <div class="user_id">홍길동</div>
              <div class="day">1일전</div>
              <div style="display:none;">댓글 번호</div>
            </div>
            <div class="mid">
            공지사항 잘 읽었습니다.
            </div>
            <div class="bottom">
             <a > 
                <i class="card xi-heart-o"></i>
               </a>
            </div>
          </div>
        </div>
        <!-- ------------------------------------------------------------------- -->
        <div class="comment2 comm">
        <input class="commentno" value="3" style="display:none;">
          <div class="profil_img">
            <a href="#"></a>
          </div>
          <div class="comment_txt">
            <div class="top">
              <div class="user_id">홍길동</div>
              <div class="day">1일전  <button onclick="md(this)">수정</button><button>삭제</button></div>
              <div style="display:none;">댓글 번호</div>
            </div>
            <div class="mid">
            공지사항 잘 읽었습니다.
            </div>
            <div class="bottom">
             <a onclick="heratadd(this)"> 
                <i class="card xi-heart-o"></i>
               </a>
            </div>
          </div>
        </div>
 <!-- ------------------------------------------------------------------- -->       
      </article>
      <article class="write_comment">
        <div class="write">
          <textarea name="" id="nae" cols="30" rows="5" placeholder="공지사항에 댓글을 남기세요"></textarea>
        </div>
        <div class="bottom">
          <div class="left_sns">
          </div>
          <button id="bt"
          onmouseleave="changeBgNone()"
          onmouseenter="changeBggray()">확인</button>
        </div>
      </article>
    </div>
  </section>

   <script type="text/javascript">
  
/*   const open = () => {
	  console.log(e);
    document.querySelector(".modal").classList.remove("hidden");
  } */
  function openk(e) {
	  console.log('open');
	  console.log(e.value);
	  document.querySelector(".modal").classList.remove("hidden");
  }

  const close = () => {
    document.querySelector(".modal").classList.add("hidden");
  }


   document.querySelector(".closeBtn").addEventListener("click", close);
  document.querySelector(".bg").addEventListener("click", close); 

</script>



<div id="msgStack"></div>
</body>
</html>