<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@	taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:import url="../layout/header.jsp" />

<script src="//developers.kakao.com/sdk/js/kakao.min.js"></script>

<!-- 공유하기 -->
<script type="text/javascript">
	function shareTwitter() {
    var sendText = "Buddy";
    var sendUrl = "localhost:8888/adopt/proView?aniNo="+${pro.ANI_NO}; // 전달할 URL
    window.open("https://twitter.com/intent/tweet?text=" + sendText + "&url=" + sendUrl);
	}
	function shareFacebook() {
	    var sendUrl = "localhost:8888/adopt/proView?aniNo="+${pro.ANI_NO}; // 전달할 URL
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
		      imageUrl: "localhost:8888/adopt/proView?aniNo="+${pro.ANI_NO}, // 콘텐츠 URL
		      link: {
		         mobileWebUrl: "localhost:8888/adopt/proView?aniNo="+${pro.ANI_NO},
		         webUrl: "localhost:8888/adopt/proView?aniNo="+${pro.ANI_NO}
		      }
		    }
		  });
		}
	function CopyUrlToClipboard(){
		var obShareUrl = document.getElementById("ShareUrl");
		obShareUrl.value = "localhost:8888/adopt/proView?aniNo="+${pro.ANI_NO};
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
	$(".btnStar").click(function() {
		if(${empty userno }){
			alert("아이를 기억하려면 로그인이 필요해요.");
			return false;
		}
	})
		$("#adoptUpdate").click(function() {
		location.href = "/adopt/proUpdate?aniNo="+${pro.ANI_NO} + "&rnum=" +${param.rnum}
	})
		$("#adoptDelete").click(function() {
		location.href = "/adopt/proDelete?aniNo="+${pro.ANI_NO}
	})
	
})

</script>

<style>
#img_wrap{
	display:inline-block;
	position:relative;
	width:335px;
	height:430px;
	margin:5px;
	z-index:1;
}
.img_style{
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
.btnAdopt:hover{
	background-color: #FF7A85;
    color: white;
}
.btnStar{
	width: 70px;
    height: 70px;
    margin-right: 20px;
    padding: 0px;
    font-size: 35px;
    background-color: white;
    border: 3px solid #FF7A85;
    color: #FF7A85;
    border-radius: 0.3em;
}  
.btnStar:hover{
	background-color: #FF7A85;
    color: white;
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
    height: 80px;
    margin-bottom: 5px;
}
.data{
	font-weight: bolder;
}
.icons{
	color:#FF7A85;
	margin-right: 22px;
}
.fileWrap{
	width: 800px;
    margin: 30px auto;
    height: 600px;
}
.recmt{
	width: 550px;
    height: 35px;
    margin: 10px 0px;
}
.cmtContent{
	border-style:none;
	background:none;
	margin-left:10px;
	width: 100%;
    height: 50px;
}
.reWrap{
	display: none;
}
.member{
	font-size: 17px;
    font-weight: bold;
}
.glyphicon-arrow-right{
	color:#FF7A85;
	font-size: 20px;
	margin-right:5px;
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
	<a href="localhost:8888/adopt/proView?aniNo="+${pro.ANI_NO} style="text-decoration: none; color: black;">
			${pro.ANI_NAME}</a>
	
	
<div class="pull-right">
<c:if test="${userno == 1 }">
		<div class="pull-right">
		<button id="adoptUpdate" class="btn btnUp">수정</button>
		<button id="adoptDelete" class="btn btnDel">삭제</button>
		</div><br>
</c:if>
</div>
	</div>
</div><br>


<div class = "row">
	<div class="col-md-4">
		<div id="img_wrap">
			<input type="text" id="state" value="${pro.ANI_CATE}" readonly="readonly"
			<c:if test="${pro.ANI_CATE eq '입양완료'}"> style="background-color: darkgray;" </c:if>>
			<img src="/adopt/adoptDown?anifileNo=${adoptFile[0].anifileNo}" alt="입양프로필" class="img_style" onerror="this.src='/resources/img/sample_adopt/noImg.jpg'">
		</div>
	</div>
	<div class="col-md-8" style="padding: 10px 0px 0px 60px;">
		<p style="font-size: 24px;">안녕하세요?</p>
		<p style="font-size: 24px;">저는 <span class="data" style="color=#FF7A85">${pro.ANI_NAME}</span>입니다.</p>
		<p><span class="glyphicon glyphicon-baby-formula icons" aria-hidden="true"></span>저는 약 <span class="data">${pro.ANI_AGE}</span>살이에요.</p>
		<p><span class="glyphicon glyphicon-sunglasses icons" aria-hidden="true"></span>중성화 <span class="data">${pro.ANI_NEUTRAL} ${pro.ANI_GENDER}</span>아이에요.</p>
		<p><span class="glyphicon glyphicon-apple icons" aria-hidden="true"></span>몸무게는 약 <span class="data">${pro.ANI_WEIGHT}</span>kg이에요.</p>
		
		<!-- 찜 -->
		<div class="btn_wrap">
		<a <c:if test="${pro.ANI_CATE ne '입양완료'}"> href="/adopt/proViewWish?aniNo=${pro.ANI_NO}&rnum=${param.rnum }"</c:if>>
		<button class="btnStar"<c:if test="${pro.ANI_CATE eq '입양완료'}"> style="border-color: darkgray;color: darkgray;background-color:white;"</c:if>>
		<c:if test="${empty pro.USERNO}">
			<span class="glyphicon glyphicon-star-empty" aria-hidden="true"></span>
		</c:if>
		<c:if test="${not empty pro.USERNO}">
			<span class="glyphicon glyphicon-star" aria-hidden="true"></span>
		</c:if>
		</button></a>
		<button class="btnAdopt" 
		<c:if test="${pro.ANI_CATE eq '입양완료'}"> disabled="disabled" style="background-color: darkgray;color:white;border-color:darkgray;"</c:if>>
		입양하기</button>
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
		      <input type="text" style="width: 188px;" id="ShareUrl" value="localhost:8888/adopt/proView?aniNo="+${pro.ANI_NO}>
		      <span class="btn-type1"><button onclick="javascript:CopyUrlToClipboard();">URL 복사</button></span>
		      </div>
		    </div>
		  </div>
		</div><br><!-- /.modal end-->
		
	</div>
		
</div><!--.row end -->
<div class="container">
<div id="content_wrap" style="font-size: 17px;">
${pro.ANI_CONTENT}
<c:forEach items="${adoptFile }" var="file" begin="1">
    <div class="fileWrap">
 	   <img class="img_style" src="/adopt/adoptDown?anifileNo=${file.anifileNo}"  alt="본문이미지" >
    </div>
</c:forEach>
</div>
</div>
<div class="cntIcon" style="display: inline-block;">
	<span class="glyphicon glyphicon-comment" aria-hidden="true">
	<span id="cntCount" class="texts">${cmtcnt }</span>
	</span>
</div>
<div class="cntIcon" style="display: inline-block;">
	<span class="glyphicon glyphicon-eye-open" aria-hidden="true">
	<span id="cntCount" class="texts">${pro.ANI_HIT}</span>
	</span>
</div>
<hr class="line">

<form action="/adopt/cmt?aniNo=${pro.ANI_NO }&rnum=${param.rnum }" method="post">
<div>
	<button class="btn catego">인기순</button>
	<button class="btn catego">최신순</button>
</div>

<div class="cmt">
	<input type="text" id="cmtUp" name="procmtContent" <c:if test="${empty userno }"> placeholder="로그인이 필요합니다" disabled="disabled"</c:if>>
	<button class="btn pull-right" style="background-color: antiquewhite;"<c:if test="${empty userno }"> disabled="disabled"</c:if>>작성</button>
</div>
</form>
<hr class="line" style="margin: 40px 0px;">

<c:forEach items="${adoptCmt }" var="cmt" >
<div class="cmt_wrap">
	<div style="margin:15px 0px;">
		<c:if test="${cmt.procmtSorts ne 0 }">
			<c:forEach var="i" begin="1" end="${cmt.procmtDepth}">
				<span class="glyphicon glyphicon-arrow-right" aria-hidden="true"></span>
			</c:forEach>
		</c:if>
		<span class="member">
			<span class="glyphicon glyphicon-user" aria-hidden="true"></span>
			<span>집사<c:if test="${cmt.userno - 1 != 0 }">${cmt.userno - 1 }</c:if></span>
		</span>
		
		<form action="/adopt/cmtUpdate?procmtNo=${cmt.procmtNo }&rnum=${param.rnum}&aniNo=${pro.ANI_NO }" method="post" style="width:550px;display:inline-block;">
			<input type="text" value="${cmt.procmtContent }" name="procmtContent" class="cmtContent" id="cmtContent${cmt.procmtNo }"<c:if test="${cmt.userno != userno }">disabled</c:if>>
		<button class="btn" style="background-color:antiquewhite;display:none;"<c:if test="${empty userno }"> disabled="disabled"</c:if>>작성</button>
		</form>
		
		<span class="pull-right"><fmt:formatDate value="${cmt.procmtDate }" pattern="yy-MM-dd"/></span>
	</div>
	
	<div>
		<button type="button" class="btn" id="recmtView" onclick="recmtUp(${cmt.procmtNo });return false;">댓글</button>
		<c:if test="${cmt.userno == userno }">
		<div class="pull-right">
			<button type="button" id="cmtContentUpdate" class="btn btnUp" onclick="cmtContentUp(${cmt.procmtNo });return false;" >수정</button>
			<a href="/adopt/cmtDelete?procmtNo=${cmt.procmtNo }&rnum=${param.rnum}&aniNo=${pro.ANI_NO }"><button class="btn btnDel">삭제</button></a>
		</div>
		</c:if>
		<div id="recmtWrap${cmt.procmtNo }" class="reWrap">
		<form action="/adopt/cmtRe?procmtGroup=${cmt.procmtGroup }&rnum=${param.rnum}&aniNo=${pro.ANI_NO }&procmtSorts=${cmt.procmtSorts }&procmtDepth=${cmt.procmtDepth}" method="post">
			<input name="procmtContent" class="recmt"<c:if test="${empty userno }"> placeholder="로그인이 필요합니다" disabled</c:if>>
		<button class="btn" style="background-color: antiquewhite;"<c:if test="${empty userno }"> disabled="disabled"</c:if>>작성</button>
		</form>
		</div>
	</div>
</div>
</c:forEach>

<script>
function cmtContentUp(f){
	console.log(f);
	var ff = '#cmtContent' + f ;
	console.log(ff);
	
	$(ff).css("border-style", "solid"); 
}
		
function recmtUp(f){
	var ff = '#recmtWrap' + f ;
	console.log(ff);
	
	if ($(ff).css("display") == "none") { 
        $(ff).show(); //display :none 일떄
    } else {
        $(ff).hide();  //display :block 일떄
    }
}
</script>

<div id="page">
<c:forEach items="${num }" var="row" >
<c:choose>
	<c:when test="${row.RNUM < param.rnum }">
		<hr class="line" style="margin-top: 50px;">
			<a href="/adopt/proView?aniNo=${row.ANI_NO }&rnum=${row.RNUM}"><span class="glyphicon glyphicon-triangle-top" aria-hidden="true">
			<span class="texts">[${row.ANI_CATE }] ${row.ANI_NAME }</span>
			</span></a>
	</c:when>
	<c:when test="${row.RNUM > param.rnum }">
		<hr class="line">
			<a href="/adopt/proView?aniNo=${row.ANI_NO }&rnum=${row.RNUM}"><span class="glyphicon glyphicon-triangle-bottom" aria-hidden="true">
			<span class="texts">[${row.ANI_CATE }] ${row.ANI_NAME }</span>
			</span></a>
		<hr class="line">
	</c:when>
</c:choose>
</c:forEach>
</div>



<div class="text-center" style="margin: 40px 0px;">
	<button id="back" class="btn btn-default" >목록</button>
</div>
</div><!-- .container end -->

<c:import url="../layout/footer.jsp" />