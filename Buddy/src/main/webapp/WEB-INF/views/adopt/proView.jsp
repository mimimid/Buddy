<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@	taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:import url="../layout/header.jsp" />

<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

<!-- 공유하기 -->
<script type="text/javascript">
	function shareTwitter() {
    var sendText = "Buddy"; // 전달할 텍스트 다시!!!!~~~~~~~~~~~~~
    var sendUrl = "localhost:8888/adopt/proView?aniNo="+${proView.aniNo}; // 전달할 URL
    window.open("https://twitter.com/intent/tweet?text=" + sendText + "&url=" + sendUrl);
	}
	function shareFacebook() {
	    var sendUrl = "localhost:8888/adopt/proView?aniNo="+${proView.aniNo}; // 전달할 URL
	    window.open("http://www.facebook.com/sharer/sharer.php?u=" + sendUrl);
	}
	function shareKakao() {
		 
		  // 사용할 앱의 JavaScript 키 설정
		  Kakao.init('9868cf00cade30b8dbb71b78ee520636');
		 
		  // 카카오링크 버튼 생성
		  Kakao.Link.createDefaultButton({
		    container: '#btnKakao', // 카카오공유버튼ID
		    objectType: 'feed',
		    content: {
		      title: "Buddy", // 보여질 제목
		      description: "Buddy 회계보고", // 보여질 설명
		      imageUrl: "localhost:8888/adopt/proView?aniNo="+${proView.aniNo}, // 콘텐츠 URL
		      link: {
		         mobileWebUrl: "localhost:8888/adopt/proView?aniNo="+${proView.aniNo},
		         webUrl: "localhost:8888/adopt/proView?aniNo="+${proView.aniNo}
		      }
		    }
		  });
		}
	function CopyUrlToClipboard(){
		var obShareUrl = document.getElementById("ShareUrl");
		obShareUrl.value = "localhost:8888/adopt/proView?aniNo="+${proView.aniNo};
		obShareUrl.select();
		document.execCommand("copy"); 
		obShareUrl.blur(); 
		alert("URL이 클립보드에 복사되었습니다"); 
	}
</script>
<script>
$(document).ready(function() {
	
	$("#back").click(function() {
		location.href = "/adopt/pro"
	})
	$(".btnAdopt").click(function() {
		location.href = "/adopt/research"
	})
})

</script>
<style>
#img_wrap{
	display:inline-block;
	position:relative;
	width:335px;
	height:430px
	;margin:5px;
	z-index:1;
}
#img_style{
	width:100%;
	height:100%;
	border-radius:0.3em;
	z-index:none;
}
#state{
	width: 120px;
    height: 50px;
    position: absolute;
    margin-bottom: 5px;
    font-size: 22px;
    font-weight: bold;
    text-align: center;
    border: none;
    border-radius: 0.3em;
    z-index: 999;
    background-color: #FF7A85;
    color: white;
}
.btn_wrap{
     margin-top: 30px; 
}
.btnAdopt{
	width: 590px;
    height: 70px;
    font-size: 25px;
    font-weight: bold;
    background-color: antiquewhite;
    color: #FF7A85;
    border: 3px solid #FF7A85;
    border-radius: 2em;
}
.btnStar{
	width: 70px;
    height: 70px;
    margin-right: 20px;
    padding: 0px;
    font-size: 30px;
    background-color: white;
    border: 3px solid #FF7A85;
    color: #FF7A85;
    border-radius: 0.3em;
}  

p{
   font-size: 20px;
   font-weight: bold;
   margin-bottom: 17px;
}
.link-icon { 
	position: relative; 
	display: inline-block; 
	width: auto;    
	font-size: 14px; 
	font-weight: 500; 
	color: #333; 
	margin-right: 10px; 
	padding-top: 50px; 
}
.link-icon.twitter { 
	background-image: url(/resources/img/icon/icon-twitter.png); 
	background-repeat: no-repeat; 
}
.link-icon.facebook { 
	background-image: url(/resources/img/icon/icon-facebook.png); 
	background-repeat: no-repeat; 
} 
.link-icon.kakao { 
	background-image: url(/resources/img/icon/icon-kakao.png); 
	background-repeat: no-repeat; 
}



.arrow_box {
	position: relative;
	background: #FF7A85;
	border: 4px solid #ffa1aa;
	padding: 15px 0px 5px 0px;
    width: 590px;
    text-align: center;
    border-radius: 0.8em;
    color: #ffd;
}
.arrow_box:after, .arrow_box:before {
	left: 100%;
	top: 50%;
	border: solid transparent;
	content: "";
	height: 0;
	width: 0;
	position: absolute;
	pointer-events: none;
}

.arrow_box:after {
	border-color: rgba(255, 122, 133, 0);
	border-left-color: #FF7A85;
	border-width: 15px;
	margin-top: -15px;
}
.arrow_box:before {
	border-color: rgba(255, 161, 170, 0);
	border-left-color: #ffa1aa;
	border-width: 20px;
	margin-top: -20px;
}
#share{
    z-index: 999;
    right: 14px;
	background-color: white;
	position: absolute;
	top: 10px;
}
#share_wrap{
	position: relative; 
	margin-top: 25px;
}
#content_wrap{
	text-align: center;
    margin: 50px 0px;
}
.cntIcon{
    width: 55px;
    height: 55px;
    border-radius: 2em;
    text-align: center;
    padding: 10px;
    background-color: antiquewhite;
    color: #FF7A85;
    border: 1px solid #FF7A85;
	margin: 3px;
}
.cmt{
	margin: 20px 0px;
    border: 1px solid lightgray;
    padding: 20px;
    height: 150px;

}
.cmt_wrap{
	margin: 0;
    border-top: 1px solid lightgray;
    border-bottom: 1px solid lightgray;
    padding: 20px;

}
.line{
	border: 1px solid lightgray;
}

.btnUp{
	background-color: cornflowerblue;
    color: white;
}

.btnDel{
	background-color: #FF7A85;
    color: white;
}
.catego{
	width: 100px;
    font-weight: bolder;
    background-color: darkgray;
    color: white;
    border-radius: 2em;
}
#cmtUp{
	width: 100%;
    height: 50px;
}
.data{
	font-weight: bolder;
}
.icons{
	color:#FF7A85;
	margin-right: 22px;
}
</style>
<div class="ballon"></div>
<div class="container">
<div  class="clearfix" style="margin-bottom: 20px;">
	<div style="width:100%;height:70px;margin-bottom:5px;" class="pull-right">
	<h3 style="margin-bottom: 20px;">입양프로필</h3>
	
	<a href="/" style="text-decoration: none; color: black;"><span class="glyphicon glyphicon-home" aria-hidden="true">Home</span></a>
	<span class="glyphicon glyphicon-menu-right" aria-hidden="true"></span>
	<a href="/adopt/pro" style="text-decoration: none; color: black;">입양</a>
	<span class="glyphicon glyphicon-menu-right" aria-hidden="true"></span>
	<a href="localhost:8888/adopt/proView?aniNo="+${proView.aniNo} style="text-decoration: none; color: black;">
			${proView.aniName }</a>
	
	
<div class="pull-right">
<%-- 	<c:if test="${id eq viewBoard.writerId }"> --%>
		<div class="pull-right">
		<button id="adoptUpdate" class="btn btnUp">수정</button>
		<button id="adoptDelete" class="btn btnDel">삭제</button>
		</div><br>
<%-- 	</c:if> --%>
</div>
	</div>
</div><br>


<div class = "row">
	<div class="col-md-4">
		<div id="img_wrap">
			<input type="text" id="state" value="입양상태">
			<img src="/resources/img/sample_adopt/sample1.jpg" alt="입양프로필" id="img_style" onerror="">
		</div>
	</div>
	<div class="col-md-8" style="padding: 10px 0px 0px 60px;">
		<p style="font-size: 24px;">안녕하세요?</p>
		<p style="font-size: 24px;">저는 <span class="data" style="color=#FF7A85">{이름}</span>입니다.</p>
		<p><span class="glyphicon glyphicon-baby-formula icons" aria-hidden="true"></span>저는 약 <span class="data">{나이}</span>살이에요.</p>
		<p><span class="glyphicon glyphicon-sunglasses icons" aria-hidden="true"></span>중성화 <span class="data">{안}한 {성별 }</span>아이에요.</p>
		<p><span class="glyphicon glyphicon-apple icons" aria-hidden="true"></span>몸무게는 약 <span class="data">{동물몸무게}</span>kg이에요.</p>
		
		<div class="btn_wrap">
		<button class="btnStar">
			<span class="glyphicon glyphicon-star-empty" aria-hidden="true"></span>
<!-- 			<span class="glyphicon glyphicon-star" aria-hidden="true"></span> -->
		</button>
		<button class="btnAdopt">입양하기</button>
		</div>
		<!-- 말풍선 -->
		<div id="share_wrap">
		<div class="arrow_box"><p>아이가 가족을 만날 수 있도록 친구에게 공유하여 추천해주세요</p></div>
		
		<!-- 공유 모달 -->
		<button type="button" id="share" class="btn pull-right" data-toggle="modal" data-target=".bs-example-modal-sm">
			<span class="glyphicon glyphicon-share" aria-hidden="true" style="font-size:35px;"></span>
		</button><br>
		</div>
		
		<div class="modal fade bs-example-modal-sm" tabindex="-1" role="dialog" aria-labelledby="mySmallModalLabel" aria-hidden="true">
		  <div class="modal-dialog modal-sm">
		    <div class="modal-content">
		      <div class="modal-header">
		        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
		        <h4 class="modal-title">공유하기</h4>
		      </div>
		      <div class="modal-body">
				<a id="btnKakao" class="link-icon kakao" href="javascript:shareKakao();">카카오톡</a>    
				<a id="btnFacebook" class="link-icon facebook" href="javascript:shareFacebook();">페이스북</a>    
				<a id="btnTwitter" class="link-icon twitter" href="javascript:shareTwitter();">트위터</a>
		      </div>
		      <div class="modal-footer">
		      <input type="text" style="width: 188px;" id="ShareUrl" value="localhost:8888/adopt/proView?aniNo="+${proView.aniNo}>
		      <span class="btn-type1"><button onclick="javascript:CopyUrlToClipboard();">URL 복사</button></span>
		      </div>
		    </div>
		  </div>
		</div><br><!-- /.modal end-->
		
	</div>
		
</div><!--.row end -->

<div id="content_wrap" style="font-size: 17px;">
본문
</div>
<div class="cntIcon" style="display: inline-block;">
	<span class="glyphicon glyphicon-comment" aria-hidden="true">
	<span id="cntCount" class="texts">3</span>
	</span>
</div>
<div class="cntIcon" style="display: inline-block;">
	<span class="glyphicon glyphicon-eye-open" aria-hidden="true">
	<span id="cntCount" class="texts">23</span>
	</span>
</div>
<hr class="line">

<form action="" method="post"></form>
<div>
	<button class="btn catego">인기순</button>
	<button class="btn catego">최신순</button>
</div>

<div class="cmt">
	<input type="text" id="cmtUp" name="" <c:if test=""> placeholder="로그인이 필요합니다"</c:if>>
	<input type="file" id="" name="" >
	<button class="btn pull-right">작성</button>
</div>
</form>
<hr class="line" style="margin: 40px 0px;">

<div class="cmt_wrap">
	<img alt="유저프로필" src="">
	<span>아이디</span>
	<span class="pull-right">작성일</span>
	<div>댓내용</div>
	<img alt="댓글첨부파일" src="">
	
	<button class="cntIcon pull-right">
	<span class="glyphicon glyphicon-heart-empty" aria-hidden="true">
	<span class="texts">좋</span>
	</span>
	<span class="glyphicon glyphicon-heart" aria-hidden="true">
	<span class="texts">좋</span>
	</span>
	</button>
	
	<div>
		<button class="btn">댓글</button>
		
		<div class="pull-right">
			<button class="btn btnUp">수정</button>
			<button class="btn btnDel">삭제</button>
		</div>
	</div>
</div>

<div id="page">
<hr class="line" style="margin-top: 50px;">
	<a><span class="glyphicon glyphicon-triangle-top" aria-hidden="true">
	<span class="texts">이전프로필</span>
	</span></a>
<hr class="line">
	<a><span class="glyphicon glyphicon-triangle-bottom" aria-hidden="true">
	<span class="texts">이후프로필</span>
	</span></a>
<hr class="line">
</div>

<div class="text-center" style="margin: 40px 0px;">
	<button id="back" class="btn btn-default" >목록</button>
</div>
</div><!-- .container end -->

<c:import url="../layout/footer.jsp" />