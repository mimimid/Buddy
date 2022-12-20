<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="https://code.jquery.com/jquery-2.2.4.min.js"></script>

<!-- 부트스트랩 3 -->
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/js/bootstrap.min.js"></script>

<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Barrio&display=swap" rel="stylesheet">

<link href="https://fonts.googleapis.com/icon?family=Material+Icons|Material+Icons+Sharp|Material+Icons+Two+Tone|Material+Icons+Outlined" rel="stylesheet">

<style type="text/css">
.modal_wrap{
        display: none;
        width: 600px;
        height: 360px;
        position: absolute;
        top:50%;
        left: 50%;
        margin: -250px 0 0 -250px;
        background:#eee;
        z-index: 2;
    }
.black_bg{
    display: none;
    position: absolute;
    content: "";
    width: 100%;
    height: 100%;
    background-color:rgba(0, 0,0, 0.5);
    top:0;
    left: 0;
    z-index: 1;
}
.modal_close{
    width: 26px;
    height: 26px;
    position: absolute;
    top: -30px;
    right: 0;
}
.modal_close> a{
    display: block;
    width: 100%;
    height: 100%;
    background:url(https://img.icons8.com/metro/26/000000/close-window.png);
    text-indent: -9999px;
}

#report_reason {
	min-height: 181px;
	min-width: 559px;
	max-width: 559px;
}

/* --------jquery 모달창 CSS--------------------- */
.modal{ 
  position:absolute; width:100%; height:100%; background: rgba(0,0,0,0.8); top:0; left:0; display:none;
}

.modal_content{
  width:400px; height:200px;
  background:#fff; border-radius:10px;
  position:relative; top:50%; left:50%;
  margin-top:-100px; margin-left:-200px;
  text-align:center;
  box-sizing:border-box; padding:74px 0;
  line-height:23px; cursor:pointer;
}

</style>

<script type="text/javascript">
window.onload = function() {
	 
    function onClick() {
        document.querySelector('.modal_wrap').style.display ='block';
        document.querySelector('.black_bg').style.display ='block';
    }   
    function offClick() {
        document.querySelector('.modal_wrap').style.display ='none';
        document.querySelector('.black_bg').style.display ='none';
    }
 
    document.getElementById('modal_btn').addEventListener('click', onClick);
    document.querySelector('.modal_close').addEventListener('click', offClick);
 
};

$(function(){ 

	  $("button").click(function(){
	    $(".modal").fadeIn();
	  });
	  
	  $(".modal_content").click(function(){
	    $(".modal").fadeOut();
	  });
	  
	});
</script>

</head>
<body>

<button type='button' id="modal_btn">모달창아 나와랏</button>
<div class="black_bg"></div>

<!-- 신고창 -->
<div class="modal_wrap">
<div class="modal-content">	<div class="modal-header">
		<h3 class="modal-title" id="formModalLabel">신고</h3>
	</div>
	<form id="report_form">
        <input type="hidden" name="board_code" value="b20211123729af795a6879">
        <input type="hidden" name="post_code" value="p20221014808730e0545de">
        <input type="hidden" name="comment_code" value="">
        <input type="hidden" name="type" value="post">
		<div class="modal-body no-padding-top no-padding-bottom">
			<textarea id="report_reason" class="form-control" name="report_reason" rows="4" placeholder="신고사유(필수)" style="height: 181px; width: 559px;"></textarea>
            <span class="text-gray">신고해주신 내용은 관리자 검토 후 내부 운영정책에 의해 조치가 진행됩니다.</span>
		</div>
	</form>
	<div class="bottom-btn text-center" style="padding:25px 0;">
		<button type="button" class="btn save_post" onclick="BOARD_COMMON.addReport()">신고하기</button>
		<div class="modal_close"><a href="#">close</a></div>
	</div>
</div>
</div>

<!-- jquery 모달창 -->
<button>모달창</button>

<div class="modal">
  <div class="modal_content" 
       title="클릭하면 창이 닫힙니다.">
    여기에 모달창 내용을 적어줍니다.<br>
    이미지여도 좋고 글이어도 좋습니다.
  </div>
</div>












</body>
</html>