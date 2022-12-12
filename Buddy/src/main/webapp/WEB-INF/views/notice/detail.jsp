<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
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
<script type="text/javascript" src="http://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/toastr.min.js"></script>
	<script src="/resources/sockjs.min.js"></script>


  <title>공지사항</title>
  <link rel="stylesheet" type="text/css" href="http://cdnjs.cloudflare.com/ajax/libs/toastr.js/latest/css/toastr.min.css" />
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

.xi-heart:before {
  content: "\ea10";
  color:red;
}

.xi-heart-o:before {
  content: "\ea11";
  color:red;
}




.frame {
  width: 90%;
  margin: 40px auto;
  text-align: center;
}
button {
  margin: 20px;
}
.custom-btn {
  width: 130px;
  height: 40px;
  color: #fff;
  border-radius: 5px;
  padding: 10px 25px;
  font-family: 'Lato', sans-serif;
  font-weight: 500;
  background: transparent;
  cursor: pointer;
  transition: all 0.3s ease;
  position: relative;
  display: inline-block;
   box-shadow:inset 2px 2px 2px 0px rgba(255,255,255,.5),
   7px 7px 20px 0px rgba(0,0,0,.1),
   4px 4px 5px 0px rgba(0,0,0,.1);
  outline: none;
}
.btn-13 {
  background-color: #89d8d3;
background-image: linear-gradient(315deg, #89d8d3 0%, #03c8a8 74%);
  border: none;
  z-index: 1;
}
.btn-13:after {
  position: absolute;
  content: "";
  width: 100%;
  height: 0;
  bottom: 0;
  left: 0;
  z-index: -1;
  border-radius: 5px;
   background-color: #4dccc6;
background-image: linear-gradient(315deg, #4dccc6 0%, #96e4df 74%);
  box-shadow:
   -7px -7px 20px 0px #fff9,
   -4px -4px 5px 0px #fff9,
   7px 7px 20px 0px #0002,
   4px 4px 5px 0px #0001;
  transition: all 0.3s ease;
}
.btn-13:hover {
  color: #fff;
}
.btn-13:hover:after {
  top: 0;
  height: 100%;
}
.btn-13:active {
  top: 2px;
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
           console.log('성공');
            }
        }); 
  
    });   
    
});
    
//-------------------------------댓글 좋아요 싫어요-----------------------------------------------
    function heratadd(e) {
    	var ncmtno = e.parentNode.parentNode.parentNode.childNodes[1].value;
    	console.log(ncmtno)
    	
    	//하트 바꾸기
    	var flag = $(e).children('i').attr('class');
    	if (flag == 'card xi-heart') {
    	$(e).children('i').removeClass("card xi-heart").addClass("card xi-heart-o");
    	//'+ㅇㅇ명' -1하기
    	const result = e.childNodes[1].childNodes[0];
    	let number = result.innerText;
    	number = parseInt(number) - 1;
  
    	result.innerText = number;
    	//댓글 싫어요 DB에 보내기
        $.ajax({
			type: "POST",
			url: "/ncmt/dislike",
			data: {ncmtno: ncmtno},
			success: function(data) {  
            }
        });
    	} else {
    		$(e).children('i').removeClass("card xi-heart-o").addClass("card xi-heart");
        	//'ㅇㅇ명' +1하기
        	const result = e.childNodes[1].childNodes[0];
        	let number = result.innerText;
        	number = parseInt(number) + 1;
      
        	result.innerText = number;
         	//댓글 좋아요 DB에 보내기
            $.ajax({
    			type: "POST",
    			url: "/ncmt/like",
    			data: {ncmtno: ncmtno},
    			success: function(data) {  
                }
            });
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
    	console.log("commentno : "+commentno);
    	console.log("content : "+content);
    	//최신순 추천순 옵션
    	//console.log(e.parentNode.parentNode.parentNode.parentNode.parentNode.parentNode.childNodes);
    	console.log(e.parentNode.parentNode.childNodes[1].childNodes[3]);
    	e.parentNode.parentNode.childNodes[1].childNodes[3].innerHTML='<button onclick="md(this)">수정</button><button>삭제</button>';

    	e.parentNode.parentNode.childNodes[3].innerText = content;
    	//DB상 내용 바꾸기	
        $.ajax({
            type: 'post',
            url: '/bcmt/modify',
            dataType: 'text',
            data: {
            	bcmtno:commentno,
            	bcmtcontent: content
            },
            success: function(){    
            }
        });
    	
  
    }
    
    function dl(e) {
		console.log('삭제 클릭');
    	//삭제될 댓글 번호
    	var ncmtno = e.parentNode.parentNode.parentNode.parentNode.childNodes[1].value;
     
    	$.ajax({
            type: 'post',
            url: '/ncmt/delete',
            dataType: 'text',
            data: {
            	ncmtno: ncmtno
            },
            async:false,
            success: function(){    
            }
        });
    		
			var selectedOption = e.parentNode.parentNode.parentNode.parentNode.parentNode.parentNode.parentNode.childNodes[1].value;
				
 			$.ajax({
				type: "GET",
				url: "/ncmt/cmtList?noticeno="+${notice[0].NOTICE_NO }+"&selectedOption="+selectedOption,
				datatype: "html",
				async:false,
				success: function(data) {
				console.log("성공");
					 $(".list").html(data);
				}		
			})    
    }


      function changeBggray() {
    		 document.getElementById('bt').style.backgroundColor = '#d3d3d3';
    	}

    	function changeBgNone() {
    		document.getElementById('bt').style.background = "none";
    		document.getElementById('bt').style.background = "none";
    	}	
    
  $(document).ready(function() {
	  //---------------------------------------------댓글리스트 처음에 자동으로 불러오기---------------------------------
	  	 $.ajax({
	  	 type: "GET",
	  	 url: "/ncmt/cmtList?noticeno="+${notice[0].NOTICE_NO }+"&selectedOption=byRecent", 
	  	 datatype: "html",
	  	 success: function(data) {
	  	 console.log("성공");
	  	 $(".list").html(data);
	  }
})

//---------------------------------------------select Ajax--------------------------------------
 	      	$("#select").change(function() {		
			var selectedOption = this.value;
			
			$.ajax({
				type: "GET",
				url: "/ncmt/cmtList?noticeno="+${notice[0].NOTICE_NO }+"&selectedOption="+selectedOption,
				datatype: "html",
				success: function(data) {
					console.log("성공");
					 $(".list").html(data);
				}
				
			})   
 	  	 })
	  

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
            <h2 title="" class="post_tit">${notice[0].TITLE }</h2>
            <p class="post_subtit">공지에 이의있다면 쪽지 주세요</p>
          </div>
          <div class="bottom">
            <div class="left">
              <a href="#"></a>
              <div class="author">
                <p>${notice[0].ADMIN_ID }</p>
                <p><fmt:formatDate value="${notice[0].W_DATE }" pattern="yy년 MM월 dd일"/> ·조회 ${notice[0].HIT }</p>
              </div>
            </div>
            <div class="right">
              <a href="#"><i class="xi-external-link"></i></a>
            </div>
          </div>
        </article>
        <article class="contents_inner">
${notice[0].CONTENT }
<c:forEach var="item" items="${notice }">
<img alt="image" src="/upload/${item.STOREDNAME }" width="60" height="240"/>
<br><br>
</c:forEach>
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
                <c:if test="${empty notice[0].LIKE_CNT }">
                <span>0</span>명이 좋아합니다
                </c:if>
                <c:if test="${not empty notice[0].LIKE_CNT }">
                <span>${notice[0].LIKE_CNT }</span>명이 좋아합니다
                </c:if>
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
  <select id="select" style=" margin-left: 81em; font:10px">
    <option value="byRecent">최신순</option>
    <option value="byLike">추천순</option>
</select>
    <div class="inner">
      <article class="list">
        <!-- ------------------------------------------------------------------- -->


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
        <div class="frame">
<button class="custom-btn btn-13">글 수정</button>
<button class="custom-btn btn-13">글 삭제</button>
</div>
      </article>
    </div>
  </section>

  


   <script type="text/javascript">
  
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
  
  
  function heartB(e) {
  	
  	var flag = $(e).children('i').attr('class');
	/* var userid = '${userid}'; */
	var userid = '${id}';
	var noticeno = parseInt('<c:out value='${notice[0].NOTICE_NO }'/>');
	console.log(noticeno);
	const cnt = e.parentNode.childNodes[3].childNodes[1].childNodes[3];
  	let number = cnt.innerText;
  	  
  	if (flag == 'card xi-heart') {
  	$(e).children('i').removeClass("card xi-heart").addClass("card xi-heart-o");
  	//좋아요 취소 ajax
     $.ajax({
        type: 'GET',
        url: '/notice/dislike?noticeno=' + noticeno + '&userid='+userid,
        dataType: 'text',
        traditional : true,
        data: {
        },
        success: function(){    
        }
    }); 
//     console.log(e.parentNode.childNodes[3].childNodes[1].childNodes[3].innerText);
	  number = parseInt(number) - 1;
	  cnt.innerText = number;


  	} else {
  		$(e).children('i').removeClass("card xi-heart-o").addClass("card xi-heart");
  		//좋아요 추가 ajax
         $.ajax({
            type: 'GET',
            url: '/notice/like?noticeno=' + noticeno + '&userid='+userid,
            dataType: 'text',
            traditional : true,
            data: {
            },
            success: function(){    
            }
        }); 
   	  number = 1;
   	  cnt.innerText = number;
  	}
  }

  function onMessage(evt) {
	    //받은 메시지 내용 추출
	    var data = evt.data.split(',')[0];
	    var sent = evt.data.split(',')[1];
	    console.log(data)
	    //toast(data);
	    toastr.info(data, sent , {timeOut: 5000});

	} 
  
	//-----------------------------------댓글 등록 event------------------------------------	  
	$("#bt").on("click",function() {
		
/* 			var writer = '<c:out value="${userId}"/>';			
		console.log(writer);
		var boardno = '<c:out value="${boardno}"/>';
		var bcmtcontent = this.parentNode.parentNode.childNodes[1].childNodes[1].value;
		console.log(this.parentNode.parentNode.childNodes[1].childNodes[1].value); */
		var writer = '김희주';
		var noticeno = '<c:out value='${notice[0].NOTICE_NO }'/>';
		var ncmtcontent = this.parentNode.parentNode.childNodes[1].childNodes[1].value;
		console.log(writer +","+ noticeno +","+ ncmtcontent);
      // 	
       $.ajax({
          type: 'post',
          url: '/ncmt/write',
          dataType: 'text',
          data: {
          	writer: writer,
          	noticeno: noticeno,
          	ncmtcontent : ncmtcontent
          },
          async:false,
          success: function(){    
          }
      });
       this.parentNode.parentNode.childNodes[1].childNodes[1].value='';
       
       console.log(this.parentNode.parentNode.parentNode.parentNode);
       
	  	 $.ajax({
		  	 type: "GET",
		  	 url: "/ncmt/cmtList?noticeno="+${notice[0].NOTICE_NO }+"&selectedOption=byRecent", 
		  	 datatype: "html",
		  	async:false,
		  	 success: function(data) {
		  	 console.log("성공");
		  	 $(".list").html(data);
		  }
	})
		
	} )  
</script>
</body>
</html>